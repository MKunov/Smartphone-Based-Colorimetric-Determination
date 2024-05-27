data = csvread("data1.csv");

d1 = data([1 14:27],1:3);
d2 = data([1 14:27],4:6);
x = [0 2.16 1.98 2.1 2.02 2.21 2.02 2.4 2.18 2.13 2.27 2.19 2.12 2.08 2.02];
x = cumsum(x);

x = x./(500+0.9*x);

figure1 = figure;
subplot(2,2,1)
scatter(x,d1,[],eye(3))
title('Sample','FontSize',14);
hold on
mdl1 = fitlm(x',d1(:,1)); mdl2 = fitlm(x',d1(:,2)); mdl3 = fitlm(x',d1(:,3));
plot(x,mdl1.Coefficients.Estimate(1)+x.*mdl1.Coefficients.Estimate(2),'r');
plot(x,mdl2.Coefficients.Estimate(1)+x.*mdl2.Coefficients.Estimate(2),'g');
plot(x,mdl3.Coefficients.Estimate(1)+x.*mdl3.Coefficients.Estimate(2),'b');
xlabel('Concentration of blackcurrant squash g/ml','FontSize',14)
ylabel('Value of RGB','FontSize',14)
legend(sprintf('y=%.f+%.fx, R^2 = %.3f',mdl1.Coefficients.Estimate(1),mdl1.Coefficients.Estimate(2),mdl1.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl2.Coefficients.Estimate(1),mdl2.Coefficients.Estimate(2),mdl2.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl3.Coefficients.Estimate(1),mdl3.Coefficients.Estimate(2),mdl3.Rsquared.Adjusted), ...
      'Location','southwest')
hold off

for i=1:length(d1)
    d1(i,:) = d1(i,:)/(sum(d1(i,:)));
end
subplot(2,2,2)
scatter(x,d1,[],eye(3))
title('Sample normalised','FontSize',14);
hold on
mdl1 = fitlm(x',d1(:,1)); mdl2 = fitlm(x',d1(:,2)); mdl3 = fitlm(x',d1(:,3));
plot(x,mdl1.Coefficients.Estimate(1)+x.*mdl1.Coefficients.Estimate(2),'r');
plot(x,mdl2.Coefficients.Estimate(1)+x.*mdl2.Coefficients.Estimate(2),'g');
plot(x,mdl3.Coefficients.Estimate(1)+x.*mdl3.Coefficients.Estimate(2),'b');
xlabel('Percentage of blackcurrant squash g/ml','FontSize',14)
ylabel('Value of RGB','FontSize',14)
legend(sprintf('y=%.3f+%.2fx, R^2 = %.3f',mdl1.Coefficients.Estimate(1),mdl1.Coefficients.Estimate(2),mdl1.Rsquared.Adjusted), ...
    sprintf('y=%.3f+%.2fx, R^2 = %.3f',mdl2.Coefficients.Estimate(1),mdl2.Coefficients.Estimate(2),mdl2.Rsquared.Adjusted), ...
    sprintf('y=%.3f+%.2fx, R^2 = %.3f',mdl3.Coefficients.Estimate(1),mdl3.Coefficients.Estimate(2),mdl3.Rsquared.Adjusted), ...
      'Location','east')
hold off

subplot(2,2,3)
scatter(x,d2,[],eye(3))
title('Corrected','FontSize',14);
hold on
mdl1 = fitlm(x',d2(:,1)); mdl2 = fitlm(x',d2(:,2)); mdl3 = fitlm(x',d2(:,3));
plot(x,mdl1.Coefficients.Estimate(1)+x.*mdl1.Coefficients.Estimate(2),'r');
plot(x,mdl2.Coefficients.Estimate(1)+x.*mdl2.Coefficients.Estimate(2),'g');
plot(x,mdl3.Coefficients.Estimate(1)+x.*mdl3.Coefficients.Estimate(2),'b');
xlabel('Concentration of blackcurrant squash g/ml','FontSize',14)
ylabel('Value of RGB','FontSize',14)
legend(sprintf('y=%.f+%.fx, R^2 = %.3f',mdl1.Coefficients.Estimate(1),mdl1.Coefficients.Estimate(2),mdl1.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl2.Coefficients.Estimate(1),mdl2.Coefficients.Estimate(2),mdl2.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl3.Coefficients.Estimate(1),mdl3.Coefficients.Estimate(2),mdl3.Rsquared.Adjusted), ...
      'Location','southwest')
hold off

for i=1:length(d2)
    d2(i,:) = d2(i,:)/(sum(d2(i,:)));
end
subplot(2,2,4)
scatter(x,d2,[],eye(3))
title('Corrected normalised','FontSize',14);
hold on
mdl1 = fitlm(x',d2(:,1)); mdl2 = fitlm(x',d2(:,2)); mdl3 = fitlm(x',d2(:,3));
plot(x,mdl1.Coefficients.Estimate(1)+x.*mdl1.Coefficients.Estimate(2),'r');
plot(x,mdl2.Coefficients.Estimate(1)+x.*mdl2.Coefficients.Estimate(2),'g');
plot(x,mdl3.Coefficients.Estimate(1)+x.*mdl3.Coefficients.Estimate(2),'b');
xlabel('Concentration of blackcurrant squash g/ml','FontSize',14)
ylabel('Percentage of RGB','FontSize',14)
legend(sprintf('y=%.3f+%.2fx, R^2 = %.3f',mdl1.Coefficients.Estimate(1),mdl1.Coefficients.Estimate(2),mdl1.Rsquared.Adjusted), ...
    sprintf('y=%.3f+%.2fx, R^2 = %.3f',mdl2.Coefficients.Estimate(1),mdl2.Coefficients.Estimate(2),mdl2.Rsquared.Adjusted), ...
    sprintf('y=%.3f+%.2fx, R^2 = %.3f',mdl3.Coefficients.Estimate(1),mdl3.Coefficients.Estimate(2),mdl3.Rsquared.Adjusted), ...
      'Location','east')
hold off