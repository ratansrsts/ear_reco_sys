for i=1:26
    if(i<10)
        dataBase(i,:)=['Images/Database/' int2str(i) '.jpg ']; 
    end    
    if(i>9)
        dataBase(i,:)=['Images/Database/' int2str(i) '.jpg'];
    end    
end
save theHGRDatabase