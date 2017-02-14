clc;
clear;
close all;

Size = 100;
sSize = sqrt(Size);

[x, y] = meshgrid([1:sSize], [1:sSize]);
xpos = reshape(x, 1, Size);
ypos = reshape(y, 1, Size);

createVotes;
epoch = 40;
eta = 0.2;
[nbrVotes, nbrAttrib] = size(votes);
outputSize = Size;
inputSize = nbrAttrib;
weights = rand(outputSize, inputSize);

for i = 1:epoch
    for j = 1:nbrVotes
        p = votes(j, :);
        dist = ones(outputSize, 1)*p - weights;
        DIST = sum(dist.^2, 2);
        [val, index] = min(DIST);
        
        nSize = round((epoch-i)*2/epoch);
        xWinner = xpos(index);
        yWinner = ypos(index);
        for wx = xWinner-nSize:xWinner+nSize
            normWx = nbghUpdate(wx, sSize);
            for wy = yWinner-nSize:yWinner+nSize
                normWy = nbghUpdate(wy, sSize);
                normW = (normWx-1)*sSize + normWy;
                distance = p - weights(normW, :);
                weights(normW, :) = weights(normW, :) + eta .* distance;
            end
        end
    end
end

pos = zeros(349, 1);
for j = 1:nbrVotes
        p = votes(j, :);
        dist = weights - ones(outputSize, 1)*p;
        dist = sum(dist.^2, 2);
        [val, index] = min(dist);
        
        pos(j) = index;
end

a = ones(1, Size)*350;
a(pos) = 1:349;

figure;
createMpparty;
p = [mpparty;0];
image(p(reshape(a,sSize,sSize))+1);

figure;
createMpdistrict;
d = [mpdistrict;0];
image(d(reshape(a,sSize,sSize))+1);

figure;
createMpsex;
s = [mpsex;0];
image(s(reshape(a,sSize,sSize))+1);

createMpnames;

[dummy, order] = sort(pos);
%animal_order = snames(order)';

table(mpnames(order), mpparty(order), mpsex(order), ...
    mpdistrict(order), ...
    pos(order), ...
    'VariableNames',{'Name', 'Party','Sex','District','Cluster'})
        