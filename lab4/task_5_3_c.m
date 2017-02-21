close all;
clear;
clc;

pict;
patterns = [p1;p2;p3];

%w = train(patterns);
N = size(p1,2);
w = randn(N, N);
w = .5 * (w + w');

[p11r, iter11, error11, energy11] = recall_update_energy(w, p11, patterns, true);
subplot(1,2,1);
plot(1:iter11,energy11);
xlabel('Iteration');
ylabel('energy val');
subplot(1,2,2);
vis(p11r);


figure
[p22r, iter22, error22, energy22] = recall_update_energy(w, p22, patterns, true);
subplot(1,2,1);
plot(1:iter22,energy22);
xlabel('Iteration');
ylabel('energy val');
subplot(1,2,2);
vis(p22r);

