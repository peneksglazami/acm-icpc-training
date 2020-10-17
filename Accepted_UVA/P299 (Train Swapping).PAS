{Problem: 299 - Train Swapping
 Northwestern European Regionals - 1994 - Problem H
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem299 (input,output);
Var
  a: Array [1..50] of Integer;
  i,j,g,buf,swap,N,L: Integer;

Begin
  ReadLn(N);
  for g:=1 to N do
    Begin
      ReadLn(L);
      for j:=1 to L do
        Read(a[j]);
      ReadLn;
      swap:=0;
      for i:=1 to L-1 do
        for j:=L downto i+1 do
          if a[j] < a[j-1] then
            Begin
              buf:=a[j];
              a[j]:=a[j-1];
              a[j-1]:=buf;
              Inc(swap);
            end;
      WriteLn('Optimal train swapping takes ',swap,' swaps.');
    end;
end.