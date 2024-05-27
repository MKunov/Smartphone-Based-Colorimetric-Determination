function [crop_RGB,crop] = RGB_pull(img)

crop = imcrop(img);
R= crop(:,:,1); R_av = mean(mean(R)); 
G = crop(:,:,2); G_av = mean(mean(G));
B = crop(:,:,3); B_av = mean(mean(B));
crop_RGB = [R_av,G_av,B_av];

end