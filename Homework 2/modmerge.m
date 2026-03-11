function totalInversions = mergeSortInversions(arr)
    [~, totalInversions] = sortAndCount(arr);
end

function [sortedArr, inversions] = sortAndCount(arr)
    
    n = length(arr);
    if n <= 1
        sortedArr = arr;
        inversions = 0;
        return;
    end
    
    % Divides array
    mid = floor(n / 2);
    left = arr(1:mid);
    right = arr(mid+1:n);
    
    % Recursively count inversions in left and right halves
    [leftSorted, leftInversions] = sortAndCount(left);
    [rightSorted, rightInversions] = sortAndCount(right);
    
    % Count split inversions during the merge step
    [sortedArr, splitInversions] = mergeAndCount(leftSorted, rightSorted);
    
    inversions = leftInversions + rightInversions + splitInversions;
end

function [mergedArr, inversions] = mergeAndCount(left, right)
    
    n1 = length(left);
    n2 = length(right);
    mergedArr = zeros(1, n1 + n2);
    i = 1; 
    j = 1; 
    k = 1; 
    inversions = 0;
    
    while i <= n1 && j <= n2
        if left(i) <= right(j)
            mergedArr(k) = left(i);
            i = i + 1;
        else
            mergedArr(k) = right(j);
            j = j + 1;
            inversions = inversions + (n1 - i + 1);
        end
        k = k + 1;
    end
    
    while i <= n1
        mergedArr(k) = left(i);
        i = i + 1;
        k = k + 1;
    end
    
    while j <= n2
        mergedArr(k) = right(j);
        j = j + 1;
        k = k + 1;
    end
end
data = [1,2,3,4,5];
inversionCount = mergeSortInversions(data);
disp(['Number of inversions: ', num2str(inversionCount)]); 

data2 = [5,4,3,2,1];
inversionCount2 = mergeSortInversions(data2);
disp(['Number of inversions: ', num2str(inversionCount2)]); 

data2 = [1,2,3,5,4];
inversionCount2 = mergeSortInversions(data2);
disp(['Number of inversions: ', num2str(inversionCount2)]);