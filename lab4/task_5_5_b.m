close all;
clear;
clc;

error = [];
energy = [];

numPattern = 150;
patterns = sign(randn(numPattern,1024));

p1dist = flip(patterns(1,:),100);

for i= 1:numPattern
    w = train(patterns(1:i,:));
    [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
    error = [error; errortemp(end)];
end
figure
plot(1:numPattern,error)
