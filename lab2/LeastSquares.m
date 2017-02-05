function [ y ] = computeLeastSquares( x, f, units )
    global var;
    makerbf;
    Phi = calcPhi(x, m, var);
    w = Phi \ f;
    y = Phi*w;
end

