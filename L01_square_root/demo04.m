% demo04.m // upgrade from demo03.m

% take squareroot of m
% m = 6;

function result = demo04(m, nf)

  true_value = sqrt(m);

  % set nf = the number of significant figures
  % nf = 4;
  es = 0.5 * 10^(2-nf);
  printf('es = %f\n',es);

  % set x = the approximation answer
  % initialize x = 0
  previous_result = 0;
  x = 0;

  % outer loop to loop for the number of digit increase
  % we want to do this for n digits
  n = 6;

  %for d = 0:n
  ea = 100;

  d = 0;

  while (abs(ea) > es) 
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
    d++;
    
  endwhile

  %printf('x = %f.\n', x);

  result = x;

endfunction


