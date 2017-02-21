close all;
clear;
clc;

error = [];
energy = [];

p1 = sign(randn(1,1024));
p2 = sign(randn(1,1024));
p3 = sign(randn(1,1024));
p4 = sign(randn(1,1024));
p5 = sign(randn(1,1024));
p6 = sign(randn(1,1024));
p7 = sign(randn(1,1024));
p8 = sign(randn(1,1024));
p9 = sign(randn(1,1024));

patterns = [p1; p2; p3; p4; p5; p6; p7; p8; p9];

p1dist = flip(p1, 100);
% subplot(2,5,1);
% vis(p1dist);
% title('Distorted');

for i= 1:9
    w = train(patterns(1:i,:));
    [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
%     subplot(2,5,i+1);
%     vis(p11r);
%     title(sprintf('Trained patterns=%d',i));
    error = [error; errortemp(end)];
end
figure
plot(1:9,error)
