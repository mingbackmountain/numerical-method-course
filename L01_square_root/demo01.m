% take squareroot of 6

% set d = the position of digit
d = 1;

% set x = the approximation answer
% initialize x = 0

x = 0;
previous_result = x;

% first step
for i = 1:10
  x = previous_result + i;
  if (x * x > 6) 
    % stop the operation
    break;
  endif
endfor

x = x - 1;
printf('x = %f\n',x)

previous_result = x;
% second step
for i = 1:10
  x = previous_result + i/10;
  if (x * x > 6)
    % stop the operation
    break;
  endif
endfor

x = x - 0.1;
printf('x = %f\n',x)

previous_result = x;
% third digit
for i = 1:10
  x = previous_result + i/100;
  if (x * x > 6)
    % stop the operation
    break;
  endif
endfor

x = x - 0.01;
printf('x = %f\n',x)






