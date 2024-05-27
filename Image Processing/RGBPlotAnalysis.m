RGBpercent = readtable('RGBpercent');
RGBpercent = table2array(RGBpercent);


hold on
grid on
scatter(RGBpercent(:,1), RGBpercent(:,2), 'r', LineWidth=1.5)
scatter(RGBpercent(:,1), RGBpercent(:,3), 'g', LineWidth=1.5)
scatter(RGBpercent(:,1), RGBpercent(:,4), 'b', LineWidth=1.5)

coefficientsR = polyfit(RGBpercent(:,1), RGBpercent(:,2), 1);
coefficientsG = polyfit(RGBpercent(:,1), RGBpercent(:,3), 1);
coefficientsB = polyfit(RGBpercent(:,1), RGBpercent(:,4), 1);

xFit = linspace(min(RGBpercent(:,1)), max(RGBpercent(:,1)), 10000);

yfitR = polyval(coefficientsR, xFit);
yfitG = polyval(coefficientsG, xFit);
yfitB = polyval(coefficientsB, xFit);

plot(xFit, yfitR, 'r--', LineWidth=1.5)
plot(xFit, yfitG, 'g--', LineWidth=1.5)
plot(xFit, yfitB, 'b--', LineWidth=1.5)
title('% RGB Data and Line of Best Fit')
ylabel('%RGB')
xlabel('GBL mg/ml')

xvals = [0, 0.14, 0.28, 0.56, 1.12];
yvalsR = coefficientsR(1)*xvals+coefficientsR(2);
yvalsG = coefficientsG(1)*xvals+coefficientsG(2);
yvalsB = coefficientsB(1)*xvals+coefficientsB(2);

errorR = abs(yvalsR-(RGBpercent(:,2)).');
errorG = abs(yvalsG-(RGBpercent(:,3)).');
errorB = abs(yvalsB-(RGBpercent(:,4)).');


percenterrR = (abs(yvalsR-(RGBpercent(:,2)).')./yvalsR).*100;
percenterrG = (abs(yvalsG-(RGBpercent(:,3)).')./yvalsG).*100;
percenterrB = (abs(yvalsB-(RGBpercent(:,4)).')./yvalsB).*100;

meanerrR = mean(percenterrR)
meanerrG = mean(percenterrG)
meanerrB = mean(percenterrB)
%0 0.14 0.28 0.56 1.12

figure;
hold on;
scatter(RGBpercent(:,1), errorR, 'r', LineWidth=1.5)
scatter(RGBpercent(:,1), errorG, 'g', LineWidth=1.5)
scatter(RGBpercent(:,1), errorB, 'b', LineWidth=1.5)
title('Residuals of RGB values')
ylabel('Residual')
xlabel('GBL mg/ml')
grid on;

corrR = corrcoef(yvalsR, RGBpercent(:,2));
corrG = corrcoef(yvalsG, RGBpercent(:,3));
corrB = corrcoef(yvalsB, RGBpercent(:,4));

figure;
subplot(2,2,1)
imagesc(corrR)
clim([0.9, 1]);
colormap('sky')
colorbar;
title('Correlation Matrix For Red') 

subplot(2,2,2)
imagesc(corrG)
clim([0.9, 1]);
colormap('sky')
colorbar;
title('Correlation Matrix For Green') 

subplot(2,2,3)
imagesc(corrB)
clim([0.9, 1]);
colormap('sky')
colorbar;
title('Correlation Matrix For Blue') 

