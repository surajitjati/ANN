close all;
clear;
clc;

pict;
patterns = [p1;p2;p3];

w = train(patterns);

[p11r, iter11, error11] = recall_update(w, p11, patterns);
subplot(2,2,1);
vis(p11);
title('p11 pic');
subplot(2,2,2);
vis(p11r);
title(sprintf('Recall from p11, Iter=%d', iter11));

%figure
[p22r, iter22, error22] = recall_update(w, p22, patterns);
subplot(2,2,3);
vis(p22);
title('p22 pic');
subplot(2,2,4);
vis(p22r);
title(sprintf('Recall from p22, Iter=%d', iter22));

