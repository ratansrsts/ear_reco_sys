

function results=formResults(input, distRatio,threshold,Selecteds);

load theHGRDatabase;

for i=1:size(Selecteds,2)
    if(i==Selecteds(i))
    
        [match1,match2,cx1,cy1,cx2,cy2,num]  = match(dataBase(Selecteds(i),:), input, distRatio);
                
    
        if num>2            
          
            for j=1:num
                distance1(j)=sqrt((match1(j,2)-cx1).^2+(match1(j,1)-cy1).^2);
                distance2(j)=sqrt((match2(j,2)-cx2).^2+(match2(j,1)-cy2).^2);
            end
            
         
            distanceSum1=sum(distance1);
            distanceSum2=sum(distance2);
            
            if(distanceSum1==0)
                distanceSum1=1;
            end
            
            if(distanceSum2==0)
                distanceSum2=1;
            end
            
            for j=1:num
                distanceRatio1(j)=distance1(j)./distanceSum1;
                distanceRatio2(j)=distance2(j)./distanceSum2;
            end
            
        
            distanceMask=abs(distanceRatio1-distanceRatio2)<threshold;
            
            distanceMaskSum=sum(distanceMask);
        else
     
            distanceMaskSum=0;
        end

        results(i,1)=cx1;
        results(i,2)=cy1; 
        results(i,3)=cx2; 
        results(i,4)=cy2; 
        results(i,5)=num; 
        results(i,6)=distanceMaskSum; 
        
       
        if(num==0);
            validRatio=0;
        else
            validRatio=distanceMaskSum/num;
        end
        results(i,7)=validRatio;
        results(i,8)=i;

        distanceRatio1=0;
        distanceRatio2=0;
        distanceMask=0;
        distanceMaskSum=0;
        
    else
        results(i,:)=0;
    end
end
