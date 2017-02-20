close all;
clear;
clc;

x1=vm([0 0 1 0 1 0 0 1]);
x2=vm([0 0 0 0 0 1 0 0]);
x3=vm([0 1 1 0 0 1 0 1]);

x = [x1;x2;x3];

w = train(x);

attractors = x;

N = size(x, 2);

for i=0:2^N-1
   xtest = vm(abs(de2bi(i, N)));
   [xtestr, iter, error] = recall_update(w, xtest, attractors);
   
   if sum(ismember(attractors, xtestr, 'rows')) == 0
       attractors = [attractors; xtestr];
   end
end

attarctors_final = t0(attractors)