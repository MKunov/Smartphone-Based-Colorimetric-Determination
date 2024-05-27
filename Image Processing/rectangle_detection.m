clear;

% Need to clear workspace after each run, otherwise it changes the edges for some reason 


img = imread("Squash1.jpg");

imfinfo("Squash1.jpg");

grey = rgb2gray(img);
% imshow(grey)
edge = edge(grey, 'Prewitt', 0.03);
figure
imshow(edge)

% Dilate to join up lines 
se = strel('disk', 3);
dilatedimg = imdilate(edge,se);
figure
imshow(dilatedimg)

labeledimg = bwlabel(dilatedimg);
props = regionprops(labeledimg, 'BoundingBox','Area');

% Threshold for rectangle detection
minarea = 10000; 
maxarea = 15000;

figure
imshow(dilatedimg)
hold on
for i = 1:numel(props)
    bb = props(i).BoundingBox;
    area = props(i).Area;
    if area>= minarea && area <= maxarea
        rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth',5);
    end
end
hold off



