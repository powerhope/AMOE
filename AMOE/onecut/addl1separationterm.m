% add L1 color separation term to the graph
% ROI is the region of interest
% separation_w is the weight of the color separation term
function [edges_addauxnode, weight_addauxnode]=addl1separationterm(edges, weight, colorlabel, separation_w, ROI)
    
    [img_h img_w ]=size(colorlabel);
	% number of neighboring pairs of pixels
	numNeighbor = size(edges,1);
    pointnumber=img_w*img_h;
    edges_addauxnode=edges;
    weight_addauxnode=weight;
    i=1;
    for x=1;img_h
        for y=1:img_w
            if(ROI(x,y))
                node_id=(x-1)*img_w+y;
                edges_addauxnode(numNeighbor+i,1)=node_id;
                edges_addauxnode(numNeighbor+i,2)=pointnumber+colorlabel(x,y);
                weight_addauxnode(numNeighbor+i,1)=separation_w;
                i=i+1;
            end  
        end
    end