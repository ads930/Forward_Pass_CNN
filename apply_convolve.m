function outarray = apply_convolve(inarray, filterbank, biasvals)

outsize = size(inarray); 
outsize(3) = size(filterbank, 4); %make 3rd dimension of array = D_2
outarray = zeros(outsize); %zeros array with third dimension of D_2

for k = 1:size(outarray, 3) %iterate from 1 to D_2
    for l = 1:size(inarray, 3) % iterate from 1 to D_1
     
       outarray(:,:,k) = outarray(:, :, k) + imfilter(inarray(:,:,l), filterbank(:,:,l,k), 'conv');
   end
   outarray(:, :, k) = outarray(:, :, k) + biasvals(k);
end
end