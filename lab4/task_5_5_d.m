clear;
close all;
clc;

numPattern = 300;
N = 100;
goodPattern1 =[];
patterns = sign(randn(numPattern,N));
% Biais
% p = sign(0.5+randn(P,N));

for i = 1:numPattern
    w = train(patterns(1:i,:));
    matched = 0;
    for j = 1:i
        patternr = patterns(j,:);
        result = recall(w, patternr);
        if sum(abs(patternr-result)) == 0
            matched = matched + 1;
        end
    end
    goodPattern1 = [goodPattern1 matched*100/i];
    %goodPattern1 = [goodPattern1 matched];
end
subplot(1,2,1);
plot(1:numPattern, goodPattern1);
title('Diag not suppressed')

goodPattern2 =[];

for i = 1:numPattern
    w = train(patterns(1:i,:));
    w = w-diag(diag(w));
    matched = 0;
    for j = 1:i
        patternr = patterns(j,:);
        result = recall(w, patternr);
        if sum(abs(patternr-result)) == 0
            matched = matched + 1;
        end
    end
    goodPattern2 = [goodPattern2 matched*100/i];
    %goodPattern2 = [goodPattern2 matched];
end
subplot(1,2,2);
plot(1:numPattern, goodPattern2);
title('Diag suppressed')