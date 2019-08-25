function [D] = C1(A)
  D = 1;
  %A = [1 3 -2; 3 2 6; 2 4 3];
  [m,n] = size(A);
  [L,U,P] = lu(A);
  %LU=PA
  %det(L)*det(U)=det(P)*det(A)
  %det(A)=(det(P)*det(U))/det(P)
  for i = 1:m
    for j = 1:n
      if(i==j)
        D *= U(i,j);
      endif
    endfor
  endfor
  D = ((D*det(L))/det(P));
endfunction



