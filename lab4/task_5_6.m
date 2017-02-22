clc;
clear;
close all;

N = 100;
numPattern = 100;
theta = 0:0.4:4.5;
rho = 0.05;

sp=1;

for bias = theta
patterns = zeros(numPattern,N);
for j = 1:numPattern
    active = randperm(N, N * rho);
    patterns(j,active) = 1;
end

matchedPattern =[];

for i = 1:numPattern
    w =  (patterns(1:i,:)-rho)'*(patterns(1:i,:)-rho);
    matched = 0;
    for j = 1:i
        patternr = patterns(j,:);
        result = recall_bias(w, patternr, bias);
        if sum(abs(patternr-result)) == 0
            matched = matched + 1;
        end
    end
    matchedPattern = [matchedPattern matched*100/i];
end
subplot(3,4,sp)
plot(1:numPattern, matchedPattern);
title(sprintf('Bias=%f',bias));
ylabel('%Matched')
sp=sp+1;
end