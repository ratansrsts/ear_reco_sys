

function [match1,match2,cx1,cy1,cx2,cy2,num]  = match(image1, image2, distRatio);
match1=0;
match2=0;
cy1=0;
cx1=0;
cy2=0;
cx2=0;
disp('Processing Image-1 (Database)');
disp(image1);
[im1, des1, loc1] = sift(image1);
im1=imread(image1); 

disp('---');
disp('Processing Image-2 (Input/Query)');
[im2, des2, loc2] = sift(image2);
im2=imread(image2); 
distRatio = distRatio;

des2t = des2';                         
for i = 1 : size(des1,1)
   dotprods = des1(i,:) * des2t;       
   [vals,indx] = sort(acos(dotprods));  

  
   if (vals(1) < distRatio * vals(2))
      myMatch(i) = indx(1);
   else
      myMatch(i) = 0;
   end
end
j=1;
for i = 1: size(des1,1)
  if (myMatch(i) > 0)
    match1(j,1)=loc1(i,1);
    match1(j,2)=loc1(i,2);
    match2(j,1)=loc2(myMatch(i),1);
    match2(j,2)=loc2(myMatch(i),2);
    j=j+1;
  end
end

im3 = appendimages(im1,im2);


num = sum(myMatch > 0); 
if (num > 1)
    s1=sum(match1);
    s2=sum(match2);
    cy1=s1(1)/num;
    cx1=s1(2)/num; 

    cy2=s2(1)/num;
    cx2=s2(2)/num; 
end
fprintf('Found %d matches.\n', num);
disp('----------------------------------');




