clear;
close all;
clc;

numPattern = 300;
N = 100;
matchedPattern1 =[];

patterns = sign(0.5+randn(numPattern,N));

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
    matchedPattern1 = [matchedPattern1 matched*100/i];
    %matchedPattern1 = [matchedPattern1 matched];
end
subplot(1,2,1);
plot(1:numPattern, matchedPattern1);
xlabel('Trained pattern')
ylabel('Matched %')
title('Diag not suppressed')

matchedPattern2 =[];

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
    matchedPattern2 = [matchedPattern2 matched*100/i];
    %matchedPattern2 = [matchedPattern2 matched];
end
subplot(1,2,2);
plot(1:numPattern, matchedPattern2);
xlabel('Trained pattern')
ylabel('Matched %')
title('Diag suppressed')