close all;
clear;
clc;

error = [];
energy = [];
pict;
patterns = [p1; p2; p3; p4; p5; p6; p7; p8; p9];

p1dist = flip(p1, 100);
subplot(2,5,1);
vis(p1dist);
title('Distorted');

for i= 1:9
    w = train(patterns(1:i,:));
    [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
    subplot(2,5,i+1);
    vis(p11r);
    title(sprintf('Trained patterns=%d',i));
    error = [error; errortemp(end)];
end
figure
plot(1:9,error)
