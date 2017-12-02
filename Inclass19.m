%In class 19
%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

y = [mean(placebo) mean(treatment1) mean(treatment2)];
x = categorical({'placebo','treatment1','treatment2'});
bar(x,y);
err = [std(placebo) std(treatment1) std(treatment2)];
hold on;
errorbar(x,y,err)

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference.

data = [placebo treatment1 treatment2];
groups = {'placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','placebo','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment1','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2','treatment2'};
[p,table,stats] = anova1(data, groups);
%is a significant difference

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

multcompare(stats)
%placebo and treatment1 are significatly different from treatment2

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

load('data.mat');
xdat = [xdat]';
ydat = [ydat]';
ydat2 = [ydat2]';
fit_1_1 = fit(xdat,ydat,'poly1');
fit_1_2 = fit(xdat,ydat,'poly2');
fit_1_3 = fit(xdat,ydat,'poly3');
fit_2_1 = fit(xdat,ydat2,'poly1');
fit_2_2 = fit(xdat,ydat2,'poly2');
fit_2_3 = fit(xdat,ydat2,'poly3');
figure;hold on;
plot(xdat,ydat,'r.','MarkerSize',18);hold on;
plot(xdat,fit_1_1(xdat),'g-','LineWidth',3);
plot(xdat,fit_1_2(xdat),'b-','LineWidth',3);
plot(xdat,fit_1_3(xdat),'k-','LineWidth',3);
%first order fits just fine, other ones should be overfitting
plot(xdat,ydat2,'r.','MarkerSize',18);hold on;
plot(xdat,fit_2_1(xdat),'g-','LineWidth',3);
plot(xdat,fit_2_2(xdat),'b-','LineWidth',3);
plot(xdat,fit_2_3(xdat),'k-','LineWidth',3);
%third order fits best
[coeff1,s1] = polyfit(xdat,ydat2,1);
[coeff2,s2] = polyfit(xdat,ydat2,2);
[coeff3,s3] = polyfit(xdat,ydat2,3);
plot(xdat,ydat2,'r.','MarkerSize',18);hold on;
plot(xdat,polyval(coeff1,xdat),'k-','LineWidth',3);
plot(xdat,polyval(coeff2,xdat),'g-','LineWidth',3);
plot(xdat,polyval(coeff3,xdat),'b-','LineWidth',3);
