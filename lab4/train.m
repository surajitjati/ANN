function [ w ] = train( x )
    w = x'*x;
end


% function [ w, iter ] = train( x )
% xold = x;
% error = 1;
% iter = 0;
% while(error > 0)
%     w = xold'*xold;
%     xold = getback(w,xold);
%     error = sum(abs(x-xold))/2;
%     iter = iter+1;
% end
% 
% end

