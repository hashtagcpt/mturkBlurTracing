more off;

E = imread('E.jpg');
%E = rgb2gray(E);

Eb = imread('Eblur.jpg');
%Eb = rgb2gray(Eb);

d = dir('ex*.jpg');

paddingE = 255.*ones(128,450);
paddingEb = 255.*ones(128,450);

paddingE(1:128,(225-64):(225+63)) = E;
paddingEb(1:128,(225-64):(225+63)) = Eb;

for tmp = 1:length(d);
    im = imread(d(tmp).name);
    %im = rgb2gray(im);
    im = [paddingE; im];
    im1(:,:,1) = im;
    im2(:,:,2) = im;
    im2(:,:,3) = im;
    
    eval(sprintf('imwrite(im,''%s_E.png'')',num2str(tmp)));
end

for tmp = 1:length(d);
    im = imread(d(tmp).name);
    %im = rgb2gray(im);
    im = [paddingEb; im];
    im1(:,:,1) = im;
    im2(:,:,2) = im;
    im2(:,:,3) = im;
    
    eval(sprintf('imwrite(im,''%s_Eb.png'')',num2str(tmp)));
end    
