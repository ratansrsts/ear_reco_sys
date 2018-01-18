
function results = hgr(input);

load theHGRDatabase

distRatio=0.65; 
threshold=0.035; 
distRatioIncrement=0.05; 
thresholdDecrement=0.005; 

Selecteds=[0 2 3 0 0 0 0 8 9 0 0 12 0 0 15 0 0 0 0 0 0 0 0 0 25 0];


mask=26;

check=1;
matchFound=0;
StringArray=Selecteds;
StringArray=StringArray+64;

while(sum(mask)>1) 
 
    results=formResults(input,distRatio,threshold,Selecteds);
    
    if(mask<=2)
        Selecteds=findMax(results(:,7),1); 
    else
     
        Selecteds=findMax(results(:,7),3);
    end
    
    disp('---------------');
    fprintf('Check %d Done.\n',check);
    disp('---------------');
    check=check+1;
  
    distRatio=distRatio+distRatioIncrement;
    if(distRatio>=0.9)
        distRatio=0.9;
    end
    
    threshold=threshold-thresholdDecrement;
    if(threshold<=0.01)
        threshold=0.01;
    end
   
    mask=(Selecteds)./(Selecteds+1);
end
fprintf('End of tests...\n');
 
for i=1:26
    if (Selecteds(i)~=0)
        matchFound=1;
        inputImage=imread(input);
        outputImage=imread(dataBase(Selecteds(i),:));
        imshow(appendimages(outputImage,inputImage));
        title('Matched Database Image -versus- Input Image');
        fprintf('Match Found: %c char.\n',StringArray(i));
    end
end

if(matchFound==0)
    fprintf('No match found...\n');
end

