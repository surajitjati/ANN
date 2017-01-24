close all;
clear;

n = 121;
alpha = 0.9;
eta = 0.01;
error = [];
epoch_total = 1000;
hidden_nodes = 50;

input_x = [-5:1:5]';
input_y = input_x;
z = exp(-input_x.*input_x*0.1) * exp(-input_y.*input_y*0.1)' - 0.5;
[gridsize, ~] = size(z);
ndata = gridsize * gridsize;

targets = reshape(z, 1, ndata);
[xx, yy] = meshgrid(input_x, input_y);
patterns_original = [reshape(xx, 1, ndata); reshape(yy, 1, ndata)];

% Randomize data
permute = randperm(ndata);
patterns = patterns_original(:, permute);
targets = targets(:, permute);

[insize, ~] = size(patterns);
[outsize, ndata] = size(targets);

% Number of points that are kept
patterns_small = patterns(:, 1:n);
targets_small = targets(:, 1:n);

[insize_small, ~] = size(patterns_small);
[outsize_small, ndata_small] = size(targets_small);

X = [patterns_small; ones(1, ndata_small)];

for hidden = 1:hidden_nodes

    w = randn(hidden, insize_small+1);
    v = randn(outsize_small, hidden+1);
    dw = 0;
    dv = 0;
    
    for epoch = 1:epoch_total
        % Forward pass
        hin = w * [patterns_small; ones(1, ndata_small)];
        hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata_small)];
        
        oin = v * hout;
        out = 2 ./ (1+exp(-oin)) - 1;
        
        % Backward pass
        delta_o = (out - targets_small) .* ((1 + out) .* (1 - out)) * 0.5;
        delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
        delta_h = delta_h(1:hidden, :);
        
        % Weight calc
        dw = (dw .* alpha) - (delta_h * X') .* (1 - alpha);
        dv = (dv .* alpha) - (delta_o * hout') .* (1 - alpha);
        w = w + dw .* eta;
        v = v + dv .* eta;        
        
    end
    
    error(hidden) = sum(sum(abs(sign(out) - targets_small)./2));

end

figure;
plot(1:hidden_nodes, error);
xlabel('hidden nodes');
ylabel('error');
legend(sprintf('n=%d, alpha = %.1f, eta=%.3f, epochs=%d', n, alpha, eta, epoch_total));

