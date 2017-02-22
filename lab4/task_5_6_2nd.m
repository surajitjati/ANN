clc;
clear;
close all;

N = 100;
numPattern = 100;
bias = 0.1;
rhoarr = [0.1 0.05 0.01];

sp=1;

for rho = rhoarr
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
subplot(2,2,sp)
plot(1:numPattern, matchedPattern);
title(sprintf('Rho=%f',rho));
ylabel('%Matched')
xlabel('Trained pattern');
sp=sp+1;
end