N = 10;

%Sin2x
x = 0:1/N:2*pi;
fun = 'sin2x';

x = x';
units = 10;
eta = 0.8;

% makerbf;
% diter;

r = [1];
etaList = 0.1:0.1:1;
for eta = etaList
    makerbf;
    itermax = 2000;
    iter = itermax;
    itersub = itermax/100;
    diter;
    r = [r max(abs(f - y))];
end
plot(etaList,r(2:end))
xlabel('eta');
ylabel('residual error');
title(['iter' num2str(iter)]);