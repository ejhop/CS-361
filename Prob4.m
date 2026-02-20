clc
clear
sizes = 500:500:3000;
time1 = zeros(size(sizes));
time2 = zeros(size(sizes));
for k=1:length(sizes)    
    A = randi(10000,1,sizes(k));
    maxVal=A(1);
    tic;
    for i = 1:(length(A))
        isMax=true;
        for j=1:(length(A))
            if A(j) > A(i)
                isMax = false;
            end
        end
        if isMax == true
            maxVal = A(i);
        end
    end

    time1(k)=toc;
    maxVal;

    tic;
    for i=2:length(A)
        if A(i) > maxVal
            maxVal = A(i);
        end
    end
    time2(k) = toc;
end
plot (sizes,time1)
hold on;
plot (sizes, time2);
xlabel('Array Size');
ylabel('Time (seconds)');
title('Performance Comparison of Max Finding Algorithms');
legend('Method 1', 'Method 2');
hold off;


%graphing n! and 2^n
n=1:10;
fact= factorial(n); 
pow = 2.^n;

figure;
plot (n,fact)
hold on;
plot(n, pow);
xlabel('n');
ylabel('2^n');
title('Power of 2 vs n');
legend('Factorial', 'Power of 2');
hold off;