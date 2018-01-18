
function Selecteds=findMax(results,depth);
Selecteds=zeros(1,26);
temp=1;

for j=1:depth    
    if(temp~=0)
        [temp location]=max(results);
        if(temp~=0)
            results(location)=0;
            Selecteds(location)=location;
        end
    end
end
