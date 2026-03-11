%n=disks source=starting peg  dest=ending peg  mid = middle peg
function count = hanoi(n, source, dest, mid)

    
    % When the smallest disk needs to be moved
    if n == 1
        fprintf('Move disk 1 from %s to %s\n', source, dest);
        count = 1;
        return;
    end
    
    % Move the n-1 disk to the middle peg
    count = hanoi(n-1, source, mid, dest);
    
    % Moves the current disk to the middle peg
    fprintf('Move disk %d from %s to %s\n', n, source, dest);
    count = count + 1;
    
    % Moves the n-1 disk to the ending peg
    count = count + hanoi(n-1, mid, dest, source);
end


total_steps = hanoi(5 , 'A', 'C', 'B');
fprintf('Total steps: %d\n', total_steps);
