function [colorbinnum, compacthist colorlabelchange]= getcompactlabel(colorlabel)

	colorhistnum=unique(colorlabel)+1; %+1是防止后面矩阵下标出现0,不同colorbin值
%     colorhist=zeros(size(colorhistnum));
    
    for i=1:length(colorhistnum)
        idx=colorhistnum(i,1); %colorbin值
        mask=(colorlabel==idx-1); 
        colorhist(idx,1)=sum(mask(:));  %sum(mask(:))是colorbin值的个数
    end
    
    compactcount=1;
    correspondence=colorhist;
    correspondence(:)=-1;
    for i=1:length(colorhist)
        if(colorhist(i,1)~=0)
            compacthist(compactcount)=colorhist(i,1); %colorbin值的个数
            correspondence(i)=compactcount; %bin值索引重新编号,correspondence的索引为原来的bin值+1
            compactcount=compactcount+1;
        end
    end
    
    colorlabelchange=colorlabel;
    for i=1:length(correspondence)
        if(correspondence(i)~=-1)
            colorlabelchange(find(colorlabel==i-1))=correspondence(i);
        end
    end
    colorbinnum=length(compacthist);
    
