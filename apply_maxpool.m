function outarray = apply_maxpool(inarray)

matrix_size = size(inarray);
numrow = matrix_size(1);
numcol = matrix_size(2);
dim_3 = matrix_size(3);

% Initialize outarray
outarray = zeros(numrow/2,numcol/2,dim_3);

row = 1;
col = 1;
for k = 1:dim_3
    % Indicies are odd numbers
    for i = 1:2:numrow
        for j = 1:2:numcol
            % Find max value out of 2x2 block
            maxValue = max(max(inarray(i:1:i+1,j:1:j+1,k)));
            outarray(row,col,k) = maxValue;

            if col == numcol/2
                col = 1;
            else
                col = col + 1;
            end

        end
    
        if row == numrow/2
            row = 1;
        else
            row = row + 1;
        end
        
    end
end

end