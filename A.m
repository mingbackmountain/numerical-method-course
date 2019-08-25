function A(m, xl, xu)
  f = @(x) m-log(x);
  xr = 0;
  nf = 6;
  es = (0.5*10^(2-nf));
  ea = 100;
  while(abs(ea)>es) 
    pxr = xr; 
    xr = xu-((f(xu)*(xu-xl))/(f(xu)-f(xl)));
    if((f(xl)*f(xr))<0)
       xu = xr;
    else
       xl = xr;
    endif
    ea=((xr-pxr)/xr)*100;
    printf("xu = %f ",xu);
    printf("xr = %f ",xr);
    printf("xl = %f ",xl);
    printf(" ea = %f\n",ea);
  endwhile
endfunction


