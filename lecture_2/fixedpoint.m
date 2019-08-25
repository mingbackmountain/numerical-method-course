function [froot,i] = fixedpoint(f, x, eps_pct, N)
  % set iterator
  i = 1;
  y = feval(f, x);
  if (y == x)
    froot = x;
    printf('x = %f.\n', x);
  else
    printf('i = %d, approx err = %f\n', i, abs(100*(y - x)/y));
    while abs(100*(y - x)/y) > eps_pct && i+1 <= N
      i = i+1;
      x = y;
      y = feval(f,x); % same as y = f(x) 
      new_approx_err = abs(100*(y - x)/y);
      printf('i = %2d, x = %f, y = %f, new_approx_err = %f\n',i,x,y, new_approx_err);
      
    endwhile
  endif
  froot = y;

endfunction