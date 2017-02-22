close all;
clear;
clc;

numPattern = 300;
patterns = sign(randn(numPattern,100));
matchedPattern1 =[];

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
title('No noise')

matchedPattern2 =[];
%p1dist = flip(patterns(1,:), 10);

for i = 1:numPattern
    w = train(patterns(1:i,:));
    matched = 0;
    for j = 1:i
        patternr = patterns(j,:);
        
        %result = recall_update(w, flip(patternr,10), patterns);
        result = recall(w, flip(patternr,10));
        if sum(abs(patternr-result)) == 0
            matched = matched + 1;
        end
    end
    matchedPattern2 = [matchedPattern2 matched*100/i];
    %matchedPattern1 = [matchedPattern1 matched];
end
subplot(1,2,2);
plot(1:numPattern, matchedPattern2);
xlabel('Trained pattern')
ylabel('Matched %')
title('With Noise')

% error = [];
% energy = [];
% for i= 1:numPattern
%     w = train(patterns(1:i,:));
%     [p11r, iter, errortemp, energytemp] = recall_update_energy_allowerror(w, p1dist, patterns, false);
%     error = [error; errortemp(end)];
% end
% figure
% plot(1:numPattern,error)