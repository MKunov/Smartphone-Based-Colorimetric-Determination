img = imread("Squash1.jpg");   %importing image and cropping
[sample_RGB,sample_img] = RGB_pull(img);
black_RGB = RGB_pull(img);
white_RGB = RGB_pull(img);
grey_RGB = RGB_pull(img);

x = [black_RGB' white_RGB' grey_RGB'];   %create x matrix of observed RGB values
y = [0,255,128];   %fitting a second degree polynomial
RGB_coef = [polyfit(x(1,:),y,2); polyfit(x(2,:),y,2); polyfit(x(3,:),y,2)]; % coefs for polyfit

x_original = linspace(0,255,1000);   %create map from original to calibrated
y_R = RGB_coef(1,1)*x_original.^2 + RGB_coef(1,2)*x_original + RGB_coef(1,3); 
y_G = RGB_coef(2,1)*x_original.^2 + RGB_coef(2,2)*x_original + RGB_coef(2,3); 
y_B = RGB_coef(3,1)*x_original.^2 + RGB_coef(3,2)*x_original + RGB_coef(3,3); 

subplot(2,3,2)
plot(x_original,y_R,'R','LineWidth',1.5); hold on     %plot sample vs corrected rgb values
plot(x_original,y_G,'G','LineWidth',1.5);
plot(x_original,y_B,'B','LineWidth',1.5);
xlabel("Original RGB values"); ylabel("Calibrated RGB values"); hold off

corrected_sample = [RGB_coef(1,1)*sample_RGB(1).^2 + RGB_coef(1,2)*sample_RGB(1) + RGB_coef(1,3) , RGB_coef(2,1).*sample_RGB(2).^2 + RGB_coef(2,2).*sample_RGB(2) + RGB_coef(2,3), RGB_coef(3,1).*sample_RGB(3).^2 + RGB_coef(3,2).*sample_RGB(3) + RGB_coef(3,3)];

newim = zeros(20,20,3);  %create image for the new corrected colour
for i = 1:3
    newim(:,:,i) = newim(:,:,i) + corrected_sample(i);
end
newim = uint8(newim);

subplot(2,2,3); imshow(sample_img); title("Sample image") %show images of original and corrected
subplot(2,2,4); imshow(newim); title("Corrected image")
