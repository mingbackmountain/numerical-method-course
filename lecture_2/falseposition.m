% Example: p140 in the book
%f = @(x) sqrt (9.81 * x / 0.25) * tanh (sqrt (9.81 * 0.25 / x) * 4) - 36
% run with command
% [froot,i] = falseposition(f,1,5,0.005,20)
%
% 

function [froot,i] = falseposition(f, xl, xu, eps_pct, N)
  printf('False Position Method\n');
  froot = 0;
  xr = 0;
  xr_prev = 0;
  i = 0;
  approx_err_pct = 100;
  
  while(approx_err_pct > eps_pct)
    i++;
    xr_prev = xr;
    f_xu = f(xu);
    f_xl = f(xl);
    xr = xu - ( f_xu * (xu - xl) / ( f_xu - f_xl ) );
    f_xr = f(xr);
    
    printf("round %d: [xl,xu] = [%f,%f], xr = %f\n",i,xl,xu,xr);
    printf("f_xu = %f, f_xl = %f, f_xr = %f\n", f_xu, f_xl, f_xr);
    if (f_xl * f_xr <= 0)
      printf("left hand side contains the root\n");
      xu = xr;
    else
      printf("right hand side contains the root\n");
      xl = xr;
    endif
    approx_err_pct = abs(100*(xr-xr_prev)/xr);
    printf("approx_err_pct = %f\n",approx_err_pct);
    xr_prev = xr;
  endwhile
  froot = xr;
endfunction