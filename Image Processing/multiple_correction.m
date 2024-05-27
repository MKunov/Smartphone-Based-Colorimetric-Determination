clear black grey white sample new_img rgb_sample rgb_corrected original_img
imagefiles = dir('*.jpg');      
nfiles = length(imagefiles);    % Number of files found

% nfiles = 42;

x =  ([9	800;	13	800;	19	800;	1220  1447])';
y = ([487	925;	1163	1469;	69	287;	1220  1447])';

% x = [56 635; 47 629; 50  630; 840 1055]'; 
% y = [391 754; 883 1150;  44 256;991 1111]';

for i = 1:nfiles
    currentfilename = imagefiles(i).name;
    currentimage = imread(currentfilename);
    black{i} = mean(mean(currentimage(y(1,1):y(2,1),x(1,1):x(2,1),:)));
    white{i} = mean(mean(currentimage(y(1,2):y(2,2),x(1,2):x(2,2),:)));
    grey{i} = mean(mean(currentimage(y(1,3):y(2,3),x(1,3):x(2,3),:)));
    sample{i} = mean(mean(currentimage(y(1,4):y(2,4),x(1,4):x(2,4),:)));
end

black = reshape(cell2mat(black),[nfiles,3]);
white = reshape(cell2mat(white),[nfiles,3]);
grey = reshape(cell2mat(grey),[nfiles,3]);
sample = reshape(cell2mat(sample),[nfiles,3]);

for i=1:nfiles
    a = [black(i,:)' white(i,:)' grey(i,:)'];   %create x matrix of observed RGB values
    b = [0,255,128];   %fitting a second degree polynomial
    RGB_coef = [polyfit(a(1,:),b,2); polyfit(a(2,:),b,2); polyfit(a(3,:),b,2)]; % coefs for polyfit
    
    currentfilename = imagefiles(i).name;
    img = imread(currentfilename);
    % img = img(1:1500,400:1600,:);
    img_r = char(img(:,:,1)); img_g = char(img(:,:,2)); img_b = char(img(:,:,3)); % split original image
    
    new_r = RGB_coef(1,1).* img_r.^2 + RGB_coef(1,2).*img_r + RGB_coef(1,3); % back into quadratics
    new_g = RGB_coef(2,1).* img_g.^2 + RGB_coef(2,2).*img_g + RGB_coef(2,3);
    new_b = RGB_coef(3,1).* img_b.^2 + RGB_coef(3,2).*img_b + RGB_coef(3,3);

    new_r = uint8((new_r));
    new_g = uint8((new_g));
    new_b = uint8((new_b));
    
    % new_r = uint8(rescale(new_r,0,255)); %rescale images to fit between 0 and 255
    % new_g = uint8(rescale(new_g,0,255));
    % new_b = uint8(rescale(new_b,0,255));

    % new_r = imadjust(new_r); % imadjust to make it span all of 0 to 255
    % new_g = imadjust(new_g);
    % new_b = imadjust(new_b);
     
    new_img{i} = cat(3,new_r,new_g,new_b); % final new image  
    rgb_sample{i} = mean(mean(img(y(1,4):y(2,4),x(1,4):x(2,4),:,:)));  
    %rgb_corrected{i} = mean(mean(new_img{i}));
    rgb_corrected{i} = mean(mean(new_img{i}(y(1,4):y(2,4),x(1,4):x(2,4),:,:)));
    % original_img{i} = currentimage(1:1500,400:1600,:);
    original_img{i} = img;
end

d1 = 7; d2 = 7;
imwrite(squeeze(cell2mat(reshape(new_img,d1,d2))),'no_processing.jpg');
imwrite(squeeze(cell2mat(reshape(original_img,d1,d2))),'original_img.jpg');
writematrix([squeeze(cell2mat(rgb_sample)) squeeze(cell2mat(rgb_corrected))] ,'data1.csv')
