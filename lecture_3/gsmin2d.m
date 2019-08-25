function [xmin,ymin,fxymin] = gsmin2d(f, xl, xu, yl, yu, eps)
  % Function: gsmax2d
  % Find x and y that maximize function f(x,y) 
  % within range [xl,xu], [yl, yu]
  %
  % f = @(x,y) exp(-((x-1)^2+(y-1)^2))
  % [x,y,fxy] = gsmax2d(f, -2, 2, -2, 2)
  % f = @(x,y) 2+x-y+2*(x^2)+2*x*y+y^2
  % [x,y,fxy] = gsmax2d(f, -2, 2, -2, 2)
  % [xmin,ymin,fxymin] = gsmin2d(f,-3,0,0,4,0.005)
  
  printf('Function: gsmax2d\n');
  eax = 100;
  eay = 100;
  %init_y = (yl+yu)/2; <-- should use this.
  init_y = 0.5;
  xmin_prev = 0;
  ymin_prev = 0;
  ymin = init_y;
  
  while ((eax > eps) && (eay > eps))
    g = @(x) f(x,ymin);
    [xmin,fxmin] = gsmin(g,xl,xu);
    printf('xmin = %f, fxmin = %f\n',xmin, fxmin);
    h = @(y) f(xmin,y);
    [ymin,fymin] = gsmin(h,yl,yu);
    printf('ymin = %f, fymin = %f\n',ymin, fymin);
    eax = abs((xmin - xmin_prev)/xmin)*100;
    eay = abs((ymin - ymin_prev)/ymin)*100;
    printf('eax = %f, eay = %f\n', eax, eay);
    xmin_prev = xmin;
    ymin_prev = ymin;    
  endwhile
  fxymin = f(xmin,ymin)
  
endfunction
  