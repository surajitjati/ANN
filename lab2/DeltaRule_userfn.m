N = 10;

x = 0:1/N:4;
fun = 'exp';

x = x';
units = 100;
eta = 0.8;

r = [1];
etaList = 0.1:0.1:1;
for eta = etaList
    makerbf;
    itermax = 4000;
    iter = itermax;
    itersub = itermax/100;
    diter;
    r = [r max(abs(f - y))];
end
figure
plot(etaList,r(2:end))
xlabel('eta');
ylabel('residual error');
title(['iter' num2str(iter)]);