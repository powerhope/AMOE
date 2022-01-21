function l1penalty=getl1penalty(colorlabelchange,box)
	returnv = 0;
	bin_num = max(max(colorlabelchange));
	obj_vector=zeros(1,bin_num);
	bkg_vector=zeros(1,bin_num);
    
    [x,y]=size(colorlabelchange);
    for i=1:x
        for j=1:y
            if(box(i,j)==0)
                obj_vector(colorlabelchange(i,j))= obj_vector(colorlabelchange(i,j))+1;
            else
                bkg_vector(colorlabelchange(i,j))= bkg_vector(colorlabelchange(i,j))+1;
            end
        end
    end
    
    for i=1:bin_num
        returnv=returnv+min(obj_vector(i),bkg_vector(i));
    end
    
	l1penalty= returnv;