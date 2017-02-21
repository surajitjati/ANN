function [ y ] = recall_bias( w, x, bias )
    y = 0.5 + 0.5 * sgn( (x*w' - bias) );
end

