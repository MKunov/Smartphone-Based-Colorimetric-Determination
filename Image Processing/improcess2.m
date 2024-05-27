im_sam = imread("IMG_2717 2.jpg"); % image for sample, black and white
im_b = imread("IMG_2717.jpg");
im_w = imread("IMG_2717 3.jpg");

measR = im_sam(:,:,1); measR_mean = mean(mean(measR)); % sample RGB values
measG = im_sam(:,:,2); measG_mean = mean(mean(measG));
measB = im_sam(:,:,3); measB_mean = mean(mean(measB));
sampleRGB = [measR_mean,measG_mean,measB_mean];

BR = im_b(:,:,1); BR_mean = mean(mean(BR)); % black RGB values
BG = im_b(:,:,2); BG_mean = mean(mean(BG));
BB = im_b(:,:,3); BB_mean = mean(mean(BB));
blackRGB = [BR_mean,BG_mean,BB_mean];

WR = im_w(:,:,1); WR_mean = mean(mean(WR)); % white RGB values
WG = im_w(:,:,2); WG_mean = mean(mean(WG));
WB = im_w(:,:,3); WB_mean = mean(mean(WB));
whiteRGB = [WR_mean,WG_mean,WB_mean];

corr = ((256 ./ (whiteRGB - blackRGB))) .* (sampleRGB - blackRGB); %correction formula

sam = round([measR_mean measG_mean measB_mean]) %print sample and corrected RGB
corr = round(corr)