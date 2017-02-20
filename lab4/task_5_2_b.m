close all;
clear;
clc;

pict;
patterns = [p1;p2;p3];

w = train(patterns);

xtest = [p11;p22];

N = size(p1,2);

for i = 1:600
    units=randperm(N);
    units=units([1:10]);  
    temp = sgn(xtest*w');
    xtest(units)=temp(units);
    subplot(1,2,1); 
    vis(xtest(1,:));
    title('Recall from p11');
    subplot(1,2,2); 
    vis(xtest(2,:));
    title('Recall from p22');
    pause(0.0001)
end

