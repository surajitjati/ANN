close all;
clear;
clc;

pict;
patterns = [p1;p2;p3];

w = train(patterns);

noise = [10:100:1000, 1024];
i=2;
rng(1);

subplot(3,4,1);
vis(p1);
title('Original')

for n = noise
    p1dist = flip(p1, n);
    [p1distr, iter, error] = recall_update(w, p1dist, patterns);
    subplot(3,4,i);
    vis(p1distr);
    title(sprintf('Added noise = %d',n));
    i = i+1;
end