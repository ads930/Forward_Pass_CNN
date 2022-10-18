close all
clear
clc

load 'debuggingTest.mat'
load 'cifar10testdata.mat'
load CNNparameters.mat
t = cputime();
%sample code to show image and access expected results
Con_Mat = zeros(10, 10); %confusion matrix
images = size(imageset, 4); %number of images in dataset
num_correct = 0;
for idx = 1:images %iterate through number of images in dataset
      %imagesc(imageset(:,:,:,idx)); truesize(gcf,[64 64]);
    in = imageset(:,:,:,idx); %access image at index, idx
    [p, i] = classify(double(in), filterbanks, biasvectors);
      

    
    true_image = classlabels{trueclass(idx)}; %find actual class of image
    calculated_image = classlabels{i}; 
    Con_Mat(i, trueclass(idx)) = Con_Mat(i, trueclass(idx)) + 1;
   
    % note, classlabels is defined in  cifar10testdata.mat’
    
    fprintf('estimated class is %s with probability %.4f\n',...
    calculated_image,p);
    fprintf(2, 'actual class is %s \n', ...
    true_image);  
end
time = ['Time Elapsed: ', num2str(cputime() - t), ' seconds'];
disp(time); %display elapsed time to run CNN
probability = ['Classification Accuracy : ', num2str(trace(Con_Mat)/sum(Con_Mat, 'all'))];
disp(Con_Mat); %display confusion matrix
disp(probability); %display success probability
