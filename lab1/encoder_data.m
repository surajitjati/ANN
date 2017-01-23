%Pattern creation

patterns = eye(8) * 2 - 1;
targets = patterns;

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);