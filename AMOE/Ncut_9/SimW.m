
I = imread('jpg_images/0_0_840.bmp');
[Inr,Inc,nb] = size(I);

if (nb>1),
    I =double(rgb2gray(I));
else
    I = double(I);
end
%% display the image
figure(1);clf; imagesc(I);colormap(gray);axis off;

[W,imageEdges] = ICgraph(I);
D = sum(W,2);
D=full(D);

save 0_0_840 W D;