%%
%#img = input image
%#R = number of rows in image
%#C = number of col in image
%#T = threshhold in decimal value(percentage)
%# border = median filter window side to be taken eg- 3 - for 3*3, 5 for 5*5
% etc and should be odd for proper functioning and more than 1

function image = median_filter(img,R,C,T,border)
    range = (border-1) /2 ;
    image = img;
    for i = range+1 : R-range 
        for j = range+1 : C-range
            
            arr = zeros(1, border^2  );
            
            for k = -range : range
                for l = -range : range
                    arr(  border*(range+k) + l+range +1   )= img(i+k , j+l);
                end
            end
            
            arr(((border^2)+1) /2 ) = []; % deleting arr[i,j] element to find median 
            
            arr = sort(arr);
            
            
            median  = arr( (border^2 -1)/2 ) + arr( (border^2 +1)/2 )  ;
            median = median/2 ;
            
            diff = median - img(i,j);
            if( ( abs(diff) /median ) > T ) 
                image(i,j) = median ;
            end
        end
    end
    
    return;
end

    
                
                
            
                                       
            