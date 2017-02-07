%Least square RBF
close all;
clear;

N = 10;
x = 0:1/N:2*pi;
%x = linspace(0,2*pi,6);
x = x';
units = 600;
%f = sin(2*x);
f = square(2*x);

makerbf;
Phi = calcPhi(x, m, var);
w = Phi \ f;
y = Phi*w;

rbfplot1(x, y, f, units);

%scatter(m,[0 0 0 0  0])

figure

%Convergence check
% r = [1];
% units = 1;
% while r(end) > 0.001
% y = LeastSquares(x, f, units);
% r = [ r max(abs(f - y))];
% units = units + 1;
% end
% r = r(1, 2:end);
% plot(1:units-1, r, 'b-');
