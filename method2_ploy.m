% take squareroot of 6
m = 6;
true_value = 2.44948974278318;

% set nf = the number of significant figures
nf = 6;
es = 0.5 * 10^(2-nf);
printf('es = %f\n',es);

% set x = the approximation answer
% initialize x = 0
previous_result = 0;
x = 2;

% outer loop to loop for the number of digit increase
% we want to do this for n digits
n = 6;

%for d = 0:n
ea = 100;

d = 1;

while (abs(ea) > es) 
  previous_result = x;
  for r = 0:10
    r = r/(10^d);
    if (((2*x)+r)*r > m-(x^2))
      break;
    endif
  endfor
  r = r-1/(10^d);
  x = previous_result+r;
  ea = ((x - previous_result)/x)*100;
  et = ((true_value - x)/true_value)*100;
  printf('x = %f, ea = %f, et = %f\n', x, ea, et);
  d++;
  
endwhile

%printf('x = %f.\n', x);



