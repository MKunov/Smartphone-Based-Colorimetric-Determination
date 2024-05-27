clear

T = readtable("Beer_Lambert.csv");

OS_uncorrected = T(1:12,2:4);
OS_corrected = T(1:12,6:8);

BC_uncorrected = T(13:26,2:4);
BC_corrected = T(13:26,6:8);

SF_uncorrected = T(27:40,2:4);
SF_corrected = T(27:40,6:8);


water_uncorrected = T(49,2:4);
water_corrected = T(49,6:8);



for i = 1:3
    BL_OS_UC(:,i) = -1 .* log10(OS_uncorrected(:,i)./water_uncorrected(1,i)); 
    BL_OS_C(:,i) = -1 .*log10(OS_corrected(:,i)./water_corrected(1,i)); 
    BL_BC_UC(:,i) = -1 .* log10(BC_uncorrected(:,i)./water_uncorrected(1,i)); 
    BL_BC_C(:,i) = -1 .* log10(BC_corrected(:,i)./water_corrected(1,i)); 
    BL_SF_UC(:,i) = -1 .* log10(SF_uncorrected(:,i)./water_uncorrected(1,i)); 
    BL_SF_C(:,i) = -1.* log10(SF_corrected(:,i)./water_corrected(1,i)); 
end


x1 = linspace(1,12,12);
x2 = linspace(1,14,14);

BL_OS_UC = table2array(BL_OS_UC); BL_OS_C = table2array(BL_OS_C);
BL_BC_UC = table2array(BL_BC_UC); BL_BC_C = table2array(BL_BC_C);
BL_SF_UC = table2array(BL_SF_UC); BL_SF_C = table2array(BL_SF_C);


tiledlayout(3,2)
nexttile(1)
hold on
plot(x1,BL_OS_UC(:,1),'r',LineWidth=1)
plot(x1,BL_OS_UC(:,2),'g',LineWidth=1)
plot(x1,BL_OS_UC(:,3),'b',LineWidth=1)
legend('red','green','blue')
ylabel('Absorption')
xlabel('Sample no.')
title('Uncorrected orange squash absorption')
nexttile(2)
hold on
plot(x1,BL_OS_C(:,1),'r',LineWidth=1)
plot(x1,BL_OS_C(:,2),'g',LineWidth=1)
plot(x1,BL_OS_C(:,3),'b',LineWidth=1)
legend('red','green','blue')
ylabel('Absorption')
xlabel('Sample no.')
title('Corrected orange squash absorption')
nexttile(3)
hold on
plot(x2,BL_BC_UC(:,1),'r',LineWidth=1)
plot(x2,BL_BC_UC(:,2),'g',LineWidth=1)
plot(x2,BL_BC_UC(:,3),'b',LineWidth=1)
legend('red','green','blue')
ylabel('Absorption')
xlabel('Sample no.')
title('Uncorrected blackcurrant squash absorption')
nexttile(4)
hold on
plot(x2,BL_BC_C(:,1),'r',LineWidth=1)
plot(x2,BL_BC_C(:,2),'g',LineWidth=1)
plot(x2,BL_BC_C(:,3),'b',LineWidth=1)
legend('red','green','blue')
ylabel('Absorption')
xlabel('Sample no.')
title('Corrected blackcurrant squash absorption')
nexttile(5)
hold on
plot(x2,BL_SF_UC(:,1),'r',LineWidth=1)
plot(x2,BL_SF_UC(:,2),'g',LineWidth=1)
plot(x2,BL_SF_UC(:,3),'b',LineWidth=1)
legend('red','green','blue')
ylabel('Absorption')
xlabel('Sample no.')
title('Uncorrected summerfruits squash absorption')
nexttile(6)
hold on
plot(x2,BL_SF_C(:,1),'r',LineWidth=1)
plot(x2,BL_SF_C(:,2),'g',LineWidth=1)
plot(x2,BL_SF_C(:,3),'b',LineWidth=1)
legend('red','green','blue')
ylabel('Absorption')
xlabel('Sample no.')
title('Corrected summerfruits squash absorption')
