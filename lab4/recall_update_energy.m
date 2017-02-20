function [ xnew, iter, error, energy ] = recall_update_energy( w, xtest, patterns, sequential )
    iter = 0;
    curr_error = 999;
    error = [];
    energy = [];
    maxIter=500;
    xnew = xtest;
    N = size(xtest,2);
    while(curr_error > 0 && iter < maxIter)
        curr_error = 999;
        if sequential
            units=randperm(N);
            units=units([1:10]);  
            temp = sgn(xnew*w');
            xnew(units)=temp(units);
        else
            xnew = sgn(xnew*w');
        end
        
        [ismem, id] = ismember(xnew, patterns, 'rows');
        if(id > 0)
            curr_error = sum(abs(patterns(id,:)-xnew))/2;
        end
        error = [error curr_error];
        energy = [energy -(xnew * w * xnew')];
        iter = iter+1;    
    end
end

