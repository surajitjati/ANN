function [ xnew, iter, error ] = recall_update( w, xtest, patterns )
    iter = 0;
    curr_error = 999;
    error = [];
    maxIter=500;
    xnew = xtest;
    while(curr_error > 0 && iter < maxIter)
        curr_error = 999;
        xnew = sgn(xnew*w');
        [ismem, id] = ismember(xnew, patterns, 'rows');
        if(id > 0)
            curr_error = sum(abs(patterns(id,:)-xnew))/2;
        end
        error = [error curr_error];
        iter = iter+1;    
    end
end

