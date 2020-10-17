{Problem: 3196 - Lenny's Lucky Lotto Lists
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
program Problem3196;
{$APPTYPE CONSOLE}
var
  t: array [1..10,1..2000] of Int64;
  a: array [1..10] of Integer;
  i,j,g,N,M,C,n_case: Integer;
  Sum: Int64;

begin
  ReadLn(C);
  for n_case:=1 to C do
    begin
      FillChar(t,SizeOf(t),0);
      ReadLn(N,M);
      a[N]:=M;
      for i:=N-1 downto 1 do
        a[i]:=a[i+1] div 2;
      for i:=1 to M do
        t[1,i]:=1;
      for i:=1 to N-1 do
        for j:=1 to a[i] do
          for g:=j*2 to M do
            t[i+1,g]:=t[i+1,g]+t[i,j];
      Sum:=0;
      for i:=1 to M do
        Inc(Sum,t[N,i]);
      WriteLn('Case ',n_case,': n = ',N,', m = ',M,', # lists = ',Sum);
    end;
end.