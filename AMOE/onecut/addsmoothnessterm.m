function addsmoothnessterm_weight=addsmoothnessterm(edges, points, img, imgVals, lambda, ROI, sigma_square)
    
    addsmoothnessterm_weight=zeros(size(edges,1),1);
    [img_w img_h z]=size(img);
	% number of neighboring pairs of pixels
	numNeighbor = size(edges,1);
	% n-link - smoothness term
	ROI1=reshape(ROI,img_w*img_h,1);
    points=points+1;
    
    for i=1:numNeighbor
        if(ROI1(edges(i,1))&ROI1(edges(i,2)))
            DI=(imgVals(edges(i,1),1)-imgVals(edges(i,2),1)).^2+(imgVals(edges(i,1),2)-imgVals(edges(i,2),2)).^2+(imgVals(edges(i,1),3)-imgVals(edges(i,2),3)).^2;
            pq=sqrt((points(edges(i,1),1)-points(edges(i,2),1))^2+(points(edges(i,1),2)-points(edges(i,2),2))^2);
            v=fn(DI, lambda, sigma_square)/pq;
            addsmoothnessterm_weight(i)=v;
        end
    end
  
    
%     
%     addsmoothnessterm_weight=zeros(size(edges,1),1);
%     [img_w img_h z]=size(img);
% 	% number of neighboring pairs of pixels
% 	numNeighbor = size(edges,1);
% 	% n-link - smoothness term
% 	ROI1=reshape(ROI,img_w*img_h,1);
%     points=points+1;
%     
%     for i=1:numNeighbor
%         if(ROI1(edges(i,1))&ROI1(edges(i,2)))
%             DI=(imgVals(edges(i,1),1)-imgVals(edges(i,2),1)).^2+(imgVals(edges(i,1),2)-imgVals(edges(i,2),2)).^2+(imgVals(edges(i,1),3)-imgVals(edges(i,2),3)).^2;
%             pq=sqrt((points(edges(i,1),1)-points(edges(i,2),1))^2+(points(edges(i,1),2)-points(edges(i,2),2))^2);
%             v=fn(DI, lambda, sigma_square)/pq;
%             addsmoothnessterm_weight(i)=v;
%         end
%     end