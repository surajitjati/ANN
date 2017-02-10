clc;
clear;
close all;

cities;
epoch = 5000;
eta = 0.8;
[nbrCity, nbrAttrib] = size(city);
outputSize = 10;
inputSize = 2;

weights = rand(outputSize, inputSize);

for i = 1:epoch
    for j = 1:nbrCity
        p = city(j, :);
        dist = ones(outputSize, 1)*p - weights;
        DIST = sum(dist.^2, 2);
        [val, index] = min(DIST);
        
        nSize = round((epoch-i+1)*2/epoch);
        
        neighboorMin = index - nSize;
        
        if neighboorMin < 1
            neighboorMin = 1;
        end
        neighboorMax = neighboorMin + 2*nSize;
        if neighboorMax > outputSize
            neighboorMax = outputSize;
        end
        for k = neighboorMin:neighboorMax
            distance = p - weights(k, :);
            weights(k, :) = weights(k, :) + eta * distance;
        end       
    end
end

tour = [weights; weights(1,:)];
plot(tour(:,1),tour(: ,2),'b-*',city(:,1),city(:,2),'ro');
