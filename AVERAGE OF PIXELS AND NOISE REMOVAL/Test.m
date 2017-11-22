clc;
clear all;
close all;

I = imread('img.jpg');
imshow(I);
title('Original Image');
figure;

J = rgb2gray(I);
imshow(J);
title('Grayscale Original Image');
figure;

err=[];
b = [];

N = 10;
sum = 0;

mean = 0.0; 
var = 0.0887;

J = im2double(J);
for i=1:N
    b = [b;(J + randn(size(J))*sqrt(var) + mean)];
    %b = [b;(imnoise(J,'gaussian',0,0.458))];
    %b = [b;(imnoise(J,'salt & pepper',0.05))];
    %b = [b;(imnoise(J,'poisson'))];
end;
for i=1:N
   err = [err; immse(J, b(225*(i-1)+1:225*(i-1)+225,:))];
   sum = sum + (b(225*(i-1)+1:225*(i-1)+225,:)/N);
end;

%stem(err); 
%figure;
i=1;
imshow(b(225*(i-1)+1:225*(i-1)+225,:));
title('NOISY IMAGE-1 With Gaussian Noise Introduced');
figure;
i=2;
imshow(b(225*(i-1)+1:225*(i-1)+225,:));
title('NOISY IMAGE-2 With Gaussian Noise Introduced');
figure;
i=3;
imshow(b(225*(i-1)+1:225*(i-1)+225,:));
title('NOSIY IMAGE-3 With Gaussian Noise Introduced');
figure;
diff = immse(J, sum);
imshow(sum);
title('IMAGE After Averaging The Pixel Values');

err=[];
sum =0;
N = 20;
b =[];
for i=1:N
    b = [b;(J + randn(size(J))*sqrt(var) + mean)];
    %b = [b;(imnoise(J,'gaussian',0,0.458))];
    %b = [b;(imnoise(J,'salt & pepper',0.05))];
    %b = [b;(imnoise(J,'poisson'))];
end;
for i=1:N
   err = [err; immse(J, b(225*(i-1)+1:225*(i-1)+225,:))];
   sum = sum + (b(225*(i-1)+1:225*(i-1)+225,:)/N);
end;
diff1 = immse(J, sum);

err=[];
sum =0;
N = 30;
b =[];
for i=1:N
    b = [b;(J + randn(size(J))*sqrt(var) + mean)];
    %b = [b;(imnoise(J,'gaussian',0,0.458))];
    %b = [b;(imnoise(J,'salt & pepper',0.05))];
    %b = [b;(imnoise(J,'poisson'))];
end;
for i=1:N
   err = [err; immse(J, b(225*(i-1)+1:225*(i-1)+225,:))];
   sum = sum + (b(225*(i-1)+1:225*(i-1)+225,:)/N);
end;
diff2 = immse(J, sum);

err=[];
sum =0;
N = 40;
b =[];
for i=1:N
    b = [b;(J + randn(size(J))*sqrt(var) + mean)];
    %b = [b;(imnoise(J,'gaussian',0,0.458))];
    %b = [b;(imnoise(J,'salt & pepper',0.05))];
    %b = [b;(imnoise(J,'poisson'))];
end;
for i=1:N
   err = [err; immse(J, b(225*(i-1)+1:225*(i-1)+225,:))];
   sum = sum + (b(225*(i-1)+1:225*(i-1)+225,:)/N);
end;
diff3 = immse(J, sum);

err=[];
sum =0;
N = 50;
b =[];
for i=1:N
    b = [b;(J + randn(size(J))*sqrt(var) + mean)];
    %b = [b;(imnoise(J,'gaussian',0,0.458))];
    %b = [b;(imnoise(J,'salt & pepper',0.05))];
    %b = [b;(imnoise(J,'poisson'))];
end;
for i=1:N
   err = [err; immse(J, b(225*(i-1)+1:225*(i-1)+225,:))];
   sum = sum + (b(225*(i-1)+1:225*(i-1)+225,:)/N);
end;
diff4 = immse(J, sum);

err=[];
sum =0;
N = 60;
b =[];
for i=1:N
    b = [b;(J + randn(size(J))*sqrt(var) + mean)];
    %b = [b;(imnoise(J,'gaussian',0,0.458))];
    %b = [b;(imnoise(J,'salt & pepper',0.05))];
    %b = [b;(imnoise(J,'poisson'))];
end;
for i=1:N
   err = [err; immse(J, b(225*(i-1)+1:225*(i-1)+225,:))];
   sum = sum + (b(225*(i-1)+1:225*(i-1)+225,:)/N);
end;
diff5 = immse(J, sum);

er = [diff diff1 diff2 diff3 diff4 diff5];
n = [10 20 30 40 50 60];
figure;
plot(n,er);