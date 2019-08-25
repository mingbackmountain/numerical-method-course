function [x,fx] = gsmax(f, xl, xu)
% Golden Section Search to find maximum
% for demonstration/teaching purpose only
% Boonsit Yimwadsana
%
% to run in Octave
% 
% >> f = @(x) sin(2*x)-(2*cos(3*x));
% >> [x, fx] = gsmax(f, 0.5, 1.5)

verbose = 1;
max_iter = 20;
es = 0.005;
phi = (1+sqrt(5))/2;
iter = 0;
xopt = 0;
while(1) % for each iteration
  xopt_prev = xopt;
  % determine x1 and x2
  d = (phi-1)*(xu-xl);
  x1 = xl + d;
  x2 = xu - d;
  if (verbose == 1)
    printf("xl = %f, xu = %f, d = %f.\n", xl, xu, d);
    printf("x1 = %f, f(x1) = %f.\n", x1, f(x1));
    printf("x2 = %f, f(x2) = %f.\n", x2, f(x2));
  endif
  if f(x1) > f(x2) % this is the only difference from the gsmin
    % then x1 should be the estimated maximum
    % then eliminate the region on the left [xl, x2]
    % reset xl_new to x2, xu remains the same
    xopt = x1;
    xl = x2;
  else
    % then x2 should be the estimated maximum
    % then eliminate the region on the right [x1, xu]
    % reset xu_new to x1, xl remains the same
    xopt = x2;
    xu = x1;
  endif
  iter++;   % increment the step count
  ea = abs((2-phi)*((xl - xu)/xopt))*100;
  if ((ea <= es) || iter >= max_iter)
    if (verbose == 1)
      printf("xopt = %d, ea = %f.  es = %f.\n",xopt,ea,es);
    endif
    break;
  endif
endwhile
x = xopt; fx = f(xopt);
    
