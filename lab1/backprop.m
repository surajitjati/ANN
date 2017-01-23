clear;
clc;
nsepdata;

X = [patterns; ones(1, ndata)];

alpha = 0.9;
eta = 0.1;
error = [];
epoch_total = 200;
hidden = 5;

w = randn(hidden, insize+1);
v = randn(outsize, hidden+1);
dw = 0;
dv = 0;

for epoch = 1:epoch_total
    % Forward pass
    hin = w * [patterns; ones(1, ndata)];
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];

    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;

    % Backward pass
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);

    % Weight calc
    dw = (dw .* alpha) - (delta_h * X') .* (1 - alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1 - alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    error(epoch) = sum(sum(abs(sign(out) - targets)./2));
    
end

figure;
plot(1:epoch_total, error);
xlabel('epoch');
ylabel('error');
legend(sprintf('alpha = %.1f, eta=%.3f, epochs=%d', alpha, eta, epoch));