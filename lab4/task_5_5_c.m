close all;
clear;
clc;

error = [];
energy = [];

numPattern = 50;

patterns = sign(randn(numPattern,100));

p1dist = flip(patterns(1,:), 10);
% subplot(2,5,1);
% vis(p1dist);
% title('Distorted');

for i= 1:numPattern
    w = train(patterns(1:i,:));
    [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
%     subplot(2,5,i+1);
%     vis(p11r);
%     title(sprintf('Trained patterns=%d',i));
    error = [error; errortemp(end)];
end
figure
plot(1:numPattern,error)
