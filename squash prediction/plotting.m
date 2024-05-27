data = csvread("data1.csv");

% d1 = data([1:13],1:3);
% d2 = data([1:13],4:6);
% x = [0 2.05 2.02 1.98 1.96 2.07 2.05 2.12 1.93 2.06 2.04 2 2.04];

d1 = data([1 14:27],1:3);
d2 = data([1 14:27],4:6);
x = [0 2.16 1.98 2.1 2.02 2.21 2.02 2.4 2.18 2.13 2.27 2.19 2.12 2.08 2.02];

% d1 = data([1 28:41],1:3);
% d2 = data([1 28:41],4:6);
% x = [0 4 4.08 4.19 4.06 4.15 4.06 4.25 4.2 4.38 4.05 3.99 4.2 4.09 4.26];

% d1 = data([1 42:46],1:3);
% d2 = data([1 42:46],4:6);
% x1 = [0 8.89 19.13+18.7 18.7 36.7 10.25];
% x2 = [0 12 21.08+7.77 30.66 30.66 10.62];
% x= x1 + x2;

% d1 = data([1 47:49],1:3);
% d2 = data([1 47:49],4:6);
% x1 = [0 12.7 25.79 25.79];
% x2 = [0 23.21 23.21 45.89];
% x= x1 + x2;

% d1 = data([1:6],1:3);
% d2 = data([1:6],4:6);
% x1 = [8.3 17.3 17.3 9.33 9.33 16.84];
% x2 = [16.43 16.43 24.22 14.22 37.07 58.7];
% x= x1 + x2;

x = cumsum(x);

figure1 = figure;
subplot(2,2,1)
scatter(x,d1,[],eye(3))
title('Sample');
hold on
X = [ones(length(x),1) x];
b = X\y
plot(x,yCalc2)
yCalc2 = X*b;
hold off

for i=1:length(d1)
    d1(i,:) = d1(i,:)/(sum(d1(i,:)));
end
subplot(2,2,2)
scatter(x,d1,[],eye(3))
title('Sample normalised');

subplot(2,2,3)
scatter(x,d2,[],eye(3))

title('Corrected');
for i=1:length(d2)
    d2(i,:) = d2(i,:)/(sum(d2(i,:)));
end
subplot(2,2,4)
scatter(x,d2,[],eye(3))
title('Corrected normalised');