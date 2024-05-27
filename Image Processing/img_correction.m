img_r = char(img(:,:,1)); img_g = char(img(:,:,2)); img_b = char(img(:,:,3));

new_r = uint8(RGB_coef(1,1).* img_r.^2 + RGB_coef(1,2).*img_r + RGB_coef(1,3));
new_g = uint8(RGB_coef(2,1).* img_g.^2 + RGB_coef(2,2).*img_g + RGB_coef(2,3));
new_b = uint8(RGB_coef(3,1).* img_b.^2 + RGB_coef(3,2).*img_b + RGB_coef(3,3));
new_img = cat(3,new_r,new_g,new_b);

subplot(1,2,1)
imshow(img); title("Original")
subplot(1,2,2)
imshow(new_img); title("Calibrated")