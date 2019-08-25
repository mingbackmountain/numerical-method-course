function [x,fx] = paraopt(f, x1, x2, x3)
% Parabolic Search to find maximum or minimum
% This method does not tell whether the point is maximum or minimum
% for demonstration/teaching purpose only
% Boonsit Yimwadsana
%
% to run in Octave
% 
% >> f = @(x) sin(2*x)-(2*cos(3*x));
% >> [x, fx] = paraopt(f, 0.5, 0.8, 1.5)

verbose = 1;
max_iter = 20;
es = 0.005;
iter = 0;
xopt = 0;
xopt_prev = 0;
while(1) % for each iteration
  xopt_prev = xopt;
  % determine x4
  alpha1 = (x2-x1)*(x2-x1)*(f(x2)-f(x3));
  alpha2 = (x2-x3)*(x2-x3)*(f(x2)-f(x1));
  beta1 = (x2-x1)*(f(x2)-f(x3));
  beta2 = (x2-x3)*(f(x2)-f(x1));
  gamma = (alpha1 - alpha2)/(beta1 - beta2);
  x4 = x2 - (0.5 * gamma);

  if (verbose == 1)
    printf("x1 = %f, f(x1) = %f.\n", x1, f(x1));
    printf("x2 = %f, f(x2) = %f.\n", x2, f(x2));
    printf("x3 = %f, f(x3) = %f.\n", x3, f(x3));
    printf("x4 = %f, f(x4) = %f.\n", x4, f(x4));
  endif
  if x4 > x2
    % this means that x4 is on the right of x2
    % then eliminate the region on the left [x1, x2]
    % reset x1 to x2, x2 to x4 and x3 remains the same
    x1 = x2;
    x2 = x4;
  else
    % this means that x4 is on the left of x2
    % then eliminate the region on the right [x2, x3]
    % reset x3 to x2, x2 to x4 and x1 remains the same
    x3 = x2;
    x2 = x4;
  endif
  xopt = x4;
  iter++;   % increment the step count
  ea = abs((xopt - xopt_prev)/xopt)*100;
  if ((ea <= es) || iter >= max_iter)
    if (verbose == 1)
      printf("xopt = %f, xopt_prev = %f, ea = %f.  es = %f.\n",xopt,xopt_prev,ea,es);
    endif
    break;
  endif
endwhile
x = xopt; fx = f(xopt);
    
