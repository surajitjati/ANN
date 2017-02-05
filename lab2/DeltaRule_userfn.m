N = 10;

x = 0:1/N:4;
fun = 'exp';

x = x';
units = 500;
eta = 0.8;

r = [1];
etaList = 1 %0.1:0.1:1;
for eta = etaList
    makerbf;
    itermax = 400000;
    iter = itermax;
    itersub = itermax/100;
    diter;
    r = [r max(abs(f - y))];
end
plot(etaList,r(2:end))
xlabel('eta');
ylabel('residual error');
title(['iter' num2str(iter)]);