function outarray = apply_fullconnect(inarray, filterbank, biasvals)

matrixSize = size(inarray);
numRows = matrixSize(1);
numCols = matrixSize(2);
D1 = matrixSize(3);
filterbankSize = size(filterbank,4);

% Creates a 1-by-1-by-filterbankSize array with zeros
outarray = double(zeros(1,1,filterbankSize));

for L = 1:filterbankSize    
    for i = 1:numRows
        for j = 1:numCols
            for k = 1:D1
                outarray(1,1,L) = outarray(1,1,L) + (filterbank(i,j,k,L) * inarray(i,j,k));     
            end
        end
    end
    outarray(1,1,L) = outarray(1,1,L) + biasvals(L);
end