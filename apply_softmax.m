function outarray = apply_softmax(inarray)

% Find D
matrixSize = size(inarray);
D = matrixSize(3);

% Calculate alpha (single value)
alpha = max(inarray(1,1,:));

% Initialize outarray with dimensions 1 x 1 x D
outarray = double(zeros(1,1,D));

% Calculate denominator
sum = 0;
for k = 1:D
    sum = sum + exp(inarray(1,1,k) - alpha);
end

% Calculate outarray
for k = 1:D
    outarray(1,1,k) = exp(inarray(1,1,k) - alpha) / sum;
end

end