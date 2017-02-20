close all;
clear;
clc;

x1=vm([0 0 1 0 1 0 0 1]);
x2=vm([0 0 0 0 0 1 0 0]);
x3=vm([0 1 1 0 0 1 0 1]);

x = [x1;x2;x3];

w = train(x);

[x1r, iter1, error1] = recall_update(w, x1, x);
[x2r, iter2, error2] = recall_update(w, x2, x);
[x3r, iter3, error3] = recall_update(w, x3, x);
%iter1
%iter2
%iter3
