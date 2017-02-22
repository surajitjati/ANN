close all;
clear;
clc;

pict;
patterns = [p1;p2;p3];

w = train(patterns);

fprintf('Energy at p1 = %f\n', - p1 * w * p1');
fprintf('Energy at p11 = %f\n', - p11 * w * p11');
fprintf('Energy at p2 = %f\n', - p2 * w * p2');
fprintf('Energy at p22 = %f\n', - p22 * w * p22');
fprintf('Energy at p3 = %f\n', - p3 * w * p3');

[p11r, iter11, error11, energy11] = recall_update_energy_allowerror(w, p11, patterns, true);
subplot(1,2,1);
plot(1:iter11,energy11);
xlabel('Iteration');
ylabel('energy val');
subplot(1,2,2);
vis(p11r);

figure
[p22r, iter22, error22, energy22] = recall_update_energy_allowerror(w, p22, patterns, true);
subplot(1,2,1);
plot(1:iter22,energy22);
xlabel('Iteration');
ylabel('energy val');
subplot(1,2,2);
vis(p22r);


