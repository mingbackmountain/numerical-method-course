% demo02.m // upgrade from demo01.m

% take squareroot of 6
m = 6;
true_value = 2.44948974278318;

% set d = the position of digit
d = 1;

% set x = the approximation answer
% initialize x = 0
previous_result = 0;
x = 0;

% outer loop to loop for the number of digit increase
% we want to do this for n digits
n = 6;

for d = 0:n
  previous_result = x;
  for i = 0:10
    x = previous_result + i/(10^d);
    if (x * x > m)
      break;
    endif
  endfor
  x = x - 1/(10^d);
  ea = ((x - previous_result)/x)*100;
  et = ((true_value - x)/true_value)*100;
  printf('x = %f, ea = %f, et = %f\n', x, ea, et);
  
endfor

%printf('x = %f.\n', x);



