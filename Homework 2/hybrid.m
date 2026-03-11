clc
clear
function arr = insertionSort (arr,left,right)

    for i = left+1:right
        key = arr(i);
        j = i - 1;
        while j >= left && arr(j) > key
            arr(j + 1) = arr(j);
            j = j - 1;
        end
        arr(j + 1) = key;
    end
end

function arr = hybridMergeSort (arr, left, right, k)
    
    if left  >= right
        return;
    end

    %when the remaining values equal less than or equal to k it starts
    %insertion sort
    if right - left + 1 <= k
            arr = insertionSort(arr, left, right);
        else
            mid = floor((left + right) / 2);
            arr = hybridMergeSort(arr, left, mid, k);
            arr = hybridMergeSort(arr, mid + 1, right, k);
            arr = merge(arr, left, mid, right);
    end
end


function arr = merge (arr,left,mid,right)
    mergedArr = zeros(1, right - left + 1);
        i = left; j = mid + 1; k = 1;
    
        while i <= mid && j <= right
            if arr(i) <= arr(j)
                mergedArr(k) = arr(i);
                i = i + 1;
            else
                mergedArr(k) = arr(j);
                j = j + 1;
            end
            k = k + 1;
        end
        while i <= mid
            mergedArr(k) = arr(i);
            i = i + 1;
            k = k + 1;
        end
        
        while j <= right
            mergedArr(k) = arr(j);
            j = j + 1;
            k = k + 1;
        end
        
        arr(left:right) = mergedArr;
end

K_values = [1, 2, 4, 8, 16, 32, 64];
array_sizes = [500, 2000, 8000];
timings = zeros(length(array_sizes),length(K_values));

for idx = 1:length(array_sizes)
    for kIdx = 1:length(K_values)
        n = array_sizes(idx);
        arr = randi(100, 1, n);
        k = K_values(kIdx);
        
        tic; 
        arr = hybridMergeSort(arr, 1, n, k);
        timings(idx, kIdx) = toc; 
    end
end

figure; 
hold on; 
for idx = 1:length(array_sizes)
    plot(K_values, timings(idx, :), '-o', 'DisplayName', sprintf('Size: %d', array_sizes(idx)));
end
hold off; 
xlabel('K Value');
ylabel('Runtime (seconds)');
title('Hybrid Merge Sort Runtime Analysis');
legend show; 
grid on; 