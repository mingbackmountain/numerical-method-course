function froot = newton(f, df, x0, eps)  
  epa = 100;
  i = 1;
  x(1) = x0;
  printf('x(1) = %f\n', x(1));
  while (epa > eps)
    x(i+1) = x(i) - (f(x(i))/df(x(i)));
    epa = abs((x(i+1) - x(i))/x(i+1))*100;
    i++;
    printf('x(%d) = %f\tepa = %f\n',i,x(i),epa);
  endwhile
  froot = x(i);
endfunction