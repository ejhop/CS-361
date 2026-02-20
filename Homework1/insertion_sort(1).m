n = 5; 
array = [4 6 11 3 9];
    
for i = 2:n
    key = array(i);
    j = i - 1;
    
    while j >= 1 && array(j) < key
        array(j + 1) = array(j);
        j = j - 1;
    end
    
    array(j + 1) = key;
end
    
sorted_array = array

