close all;
clear;
clc;

x1=vm([0 0 1 0 1 0 0 1]);
x2=vm([0 0 0 0 0 1 0 0]);
x3=vm([0 1 1 0 0 1 0 1]);

x = [x1;x2;x3];

w = train(x);

x1d4=vm([1 1 0 0 1 1 0 1]);
x1d5=vm([1 1 0 0 1 0 1 1]);
x2d3=vm([1 1 0 0 1 1 0 0]);
x2d4=vm([1 1 0 1 0 0 0 0]);
x3d4=vm([1 1 0 1 0 0 0 1]);

[x1r4, iter1_4error, error14] = recall_update(w, x1d4, x);
[x1r5, iter1_5error, error15] = recall_update(w, x1d5, x);
[x2r3, iter2_3error, error23] = recall_update(w, x2d3, x);
[x2r4, iter2_4error, error24] = recall_update(w, x2d4, x);
[x3r4, iter3_4error, error34] = recall_update(w, x3d4, x);
iter1_4error
iter1_5error
iter2_3error
iter2_4error
iter3_4error


