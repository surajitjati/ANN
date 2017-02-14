function [ normW ] = keepBorder( w, outputSize )
if w > outputSize
    normW = outputSize;
elseif w < 1
    normW = 1;
else
    normW = w;
end

end

