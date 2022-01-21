function [colorbinnum, compacthist colorlabelchange]= getcompactlabel(colorlabel)

	colorhistnum=unique(colorlabel)+1; %+1�Ƿ�ֹ��������±����0,��ͬcolorbinֵ
%     colorhist=zeros(size(colorhistnum));
    
    for i=1:length(colorhistnum)
        idx=colorhistnum(i,1); %colorbinֵ
        mask=(colorlabel==idx-1); 
        colorhist(idx,1)=sum(mask(:));  %sum(mask(:))��colorbinֵ�ĸ���
    end
    
    compactcount=1;
    correspondence=colorhist;
    correspondence(:)=-1;
    for i=1:length(colorhist)
        if(colorhist(i,1)~=0)
            compacthist(compactcount)=colorhist(i,1); %colorbinֵ�ĸ���
            correspondence(i)=compactcount; %binֵ�������±��,correspondence������Ϊԭ����binֵ+1
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
    
