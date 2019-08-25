% Example: p140 in the book
% f = @(x) sqrt (9.81 * x / 0.25) * tanh (sqrt (9.81 * 0.25 / x) * 4) - 36
% run with command
% [froot,i] = bisection(f,40,200,0.005,20)
%
% 

function [froot,i] = bisection(f, xl, xu, eps_pct, N)
  printf('Bisection Method\n');
  froot = 0;
  xr = (xu+xl)/2;
  xr_prev = 0;
  i = 0;
  approx_err_pct = 100;
  
  while(approx_err_pct > eps_pct)
    i++;
    xr = (xl+xu)/2;
    f_xl = f(xl);
    f_xr = f(xr);  
    printf("round %d: [xl,xu] = [%f,%f], xr = %f\t",i,xl,xu,xr);
    if (f_xl * f_xr <= 0)
      xu = xr;
    else
      xl = xr;
    endif
    approx_err_pct = abs(100*(xr-xr_prev)/xr);
    printf("approx_err_pct = %f\n",approx_err_pct);
    xr_prev = xr;
  endwhile
  froot = xr;
endfunction