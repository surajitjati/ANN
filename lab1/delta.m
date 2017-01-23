clear;
clc

sepdata;

w = randn(1, 3);
%w=zeros(1,3);
X = [patterns; ones(1, ndata)];

eta = 0.001;   %recomended: 0.001 
epoch_total = 20; %recomended: 20

for epoch = 1:epoch_total
    
    deltaW = -eta*( w*X - targets)*X';
    w = w + deltaW;
    
    p = w(1, 1:2);
    k = -w(1, insize+1) / (p*p');
    l = sqrt(p*p');
    axis([-2, 2, -2, 2], 'square');
    plot (patterns(1, find(targets>0)), ...
        patterns(2, find(targets>0)), '*', ...
        patterns(1, find(targets<0)), ...
        patterns(2, find(targets<0)), '+', ...
        [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
        [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
    drawnow;

end
xlabel('Linear classification');
legend(sprintf('eta=%.3f, epochs=%d', eta, epoch));
