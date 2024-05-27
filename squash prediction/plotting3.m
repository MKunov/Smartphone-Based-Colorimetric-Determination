data = csvread("data1.csv");

% d1 = data([1:13],4:6);
d2 = data([1 14:27],4:6);
d3 = data([1 28:41],4:6);
% x1 = [0 2.05 2.02 1.98 1.96 2.07 2.05 2.12 1.93 2.06 2.04 2 2.04];
x2 = [0 2.16 1.98 2.1 2.02 2.21 2.02 2.4 2.18 2.13 2.27 2.19 2.12 2.08 2.02];
x3 = [0 4 4.08 4.19 4.06 4.15 4.06 4.25 4.2 4.38 4.05 3.99 4.2 4.09 4.26];


% x1 = cumsum(x1);
% x1 = x1./(500+0.9*x1)
x2 = cumsum(x2);
% x2 = x2./(500+0.9*x2);
x3 = cumsum(x3);
% x3 = x3./(500+0.9*x3);

subplot(2,1,1)
scatter(x3,d3,[],eye(3))
title('Corrected','FontSize',14);
hold on
mdl1 = fitlm(x3',d3(:,1)); mdl2 = fitlm(x3',d3(:,2)); mdl3 = fitlm(x3',d3(:,3));
plot(x3,mdl1.Coefficients.Estimate(1)+x3.*mdl1.Coefficients.Estimate(2),'r');
plot(x3,mdl2.Coefficients.Estimate(1)+x3.*mdl2.Coefficients.Estimate(2),'g');
plot(x3,mdl3.Coefficients.Estimate(1)+x3.*mdl3.Coefficients.Estimate(2),'b');
xlabel('Concentration of blackcurrant squash g/ml','FontSize',14)
ylabel('Value of RGB','FontSize',14)
legend(sprintf('y=%.f+%.fx, R^2 = %.3f',mdl1.Coefficients.Estimate(1),mdl1.Coefficients.Estimate(2),mdl1.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl2.Coefficients.Estimate(1),mdl2.Coefficients.Estimate(2),mdl2.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl3.Coefficients.Estimate(1),mdl3.Coefficients.Estimate(2),mdl3.Rsquared.Adjusted), ...
      'Location','southwest')
hold off

subplot(2,1,2)
scatter(x2,d2,[],eye(3))
title('Corrected','FontSize',14);
hold on
mdl4 = fitlm(x2',d2(:,1)); mdl5 = fitlm(x2',d2(:,2)); mdl6 = fitlm(x2',d2(:,3));
plot(x2,mdl4.Coefficients.Estimate(1)+x2.*mdl4.Coefficients.Estimate(2),'r');
plot(x2,mdl5.Coefficients.Estimate(1)+x2.*mdl5.Coefficients.Estimate(2),'g');
plot(x2,mdl6.Coefficients.Estimate(1)+x2.*mdl6.Coefficients.Estimate(2),'b');
xlabel('Concentration of summer fruits squash g/ml','FontSize',14)
ylabel('Value of RGB','FontSize',14)
legend(sprintf('y=%.f+%.fx, R^2 = %.3f',mdl4.Coefficients.Estimate(1),mdl4.Coefficients.Estimate(2),mdl4.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl5.Coefficients.Estimate(1),mdl5.Coefficients.Estimate(2),mdl5.Rsquared.Adjusted), ...
    sprintf('y=%.f+%.fx, R^2 = %.3f',mdl6.Coefficients.Estimate(1),mdl6.Coefficients.Estimate(2),mdl6.Rsquared.Adjusted), ...
      'Location','southwest')
hold off

a = [mdl1.Coefficients.Estimate(1); mdl2.Coefficients.Estimate(1);mdl3.Coefficients.Estimate(1)]; %a+bx
b = [mdl1.Coefficients.Estimate(2); mdl2.Coefficients.Estimate(2); mdl3.Coefficients.Estimate(2)];
c = [mdl4.Coefficients.Estimate(1); mdl5.Coefficients.Estimate(1); mdl6.Coefficients.Estimate(1)];%c+dx
d = [mdl4.Coefficients.Estimate(2); mdl5.Coefficients.Estimate(2); mdl6.Coefficients.Estimate(2)];

m = [];
for i=1:3
    img = data(end-3+i,4:6)
    sln = linsolve(0.5*[b d],[img'-0.5*(a+c)]);
    % sln = [sln linsolve(0.5*[b d],[img'-0.5*(a+c)])];
    m = [m sln];
end
m

