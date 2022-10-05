function [probability, index] = classify(inarray, filterbanks, biasvectors) 
%returns max probability and index of an image
outarray = apply_imnormalize(inarray);
outarray = apply_convolve(outarray, filterbanks{2}, biasvectors{2});
outarray = apply_relu(outarray);
outarray = apply_convolve(outarray, filterbanks{4}, biasvectors{4});
outarray = apply_relu(outarray);
outarray = apply_maxpool(outarray);
outarray = apply_convolve(outarray, filterbanks{7}, biasvectors{7});
outarray = apply_relu(outarray);
outarray = apply_convolve(outarray, filterbanks{9}, biasvectors{9});
outarray = apply_relu(outarray);
outarray = apply_maxpool(outarray);
outarray = apply_convolve(outarray, filterbanks{12}, biasvectors{12});
outarray = apply_relu(outarray);
outarray = apply_convolve(outarray, filterbanks{14}, biasvectors{14});
outarray = apply_relu(outarray);
outarray = apply_maxpool(outarray);
outarray = apply_fullconnect(outarray, filterbanks{17}, biasvectors{17});
outarray = apply_softmax(outarray);
[probability, index] = max(outarray);

end
