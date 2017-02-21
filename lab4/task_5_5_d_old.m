close all;
clear;
clc;

error = [];
energy = [];

numPattern = 100;

patterns = sign(randn(numPattern,100));

p1dist = flip(patterns(1,:), 5);

for i= 1:numPattern
    w = train(patterns(1:i,:));
    [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
    error = [error; errortemp(end)];
end
subplot(1,2,1)
plot(1:numPattern,error)
title('Diag not suppressed')

error = [];

for i= 1:numPattern
    w = train(patterns(1:i,:));
    w = w-diag(diag(w));
    [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
    error = [error; errortemp(end)];
end
subplot(1,2,2)
plot(1:numPattern,error)
title('Diag suppressed')