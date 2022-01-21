
function colorlabel=rgb2indeximg(img,channelstep)
    channelbin = int32(256/channelstep);
    rgb_index=int32(img/channelstep);
    colorlabel=rgb_index(:,:,1)+rgb_index(:,:,2)*channelbin+rgb_index(:,:,3)*channelbin*channelbin;
end