{Problem: 216 - Getting in Line
 ACM ICPC World Finals - 1992 - Problem B
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem216 (input, output);
Var
  A,Best: Array [1..8] of Integer;
  D: Array [1..8,1..8] of Double;
  P: Array [1..8,1..2] of Integer;
  B: Array [1..8] of Boolean;
  i,j,N,n_case: Integer;
  BestSum: Double;

Procedure Find(i: Integer);
Var
  j: Integer;
  Sum: Double;
Begin
  if i > N then
    Begin
      Sum:=0;
      for j:=2 to N do
        Sum:=Sum+16+D[A[j],A[j-1]];
      if Sum < BestSum then
        Begin
          BestSum:=Sum;
          Best:=A;
        end;
    end
  else
    for j:=1 to N do
      if B[j] then
        Begin
          B[j]:=False;
          A[i]:=j;
          Find(i+1);
          B[j]:=True;
        end;
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        ReadLn(P[i,1],P[i,2]);
      for i:=1 to N-1 do
        for j:=i+1 to N do
          Begin
            D[i,j]:=Sqrt(Sqr(p[i,1]-p[j,1])+Sqr(p[i,2]-p[j,2]));
            D[j,i]:=D[i,j];
          end;
      FillChar(B,SizeOf(B),True);
      BestSum:=1000000000;
      Find(1);
      WriteLn('**********************************************************');
      Inc(n_case);
      WriteLn('Network #',n_case);
      A:=Best;
      for i:=2 to N do
        WriteLn('Cable requirement to connect (',p[a[i-1],1],',',p[a[i-1],2],') to (',p[a[i],1],',',p[a[i],2],') is ',
                D[a[i-1],a[i]]+16:0:2,' feet.');
      WriteLn('Number of feet of cable required is ',BestSum:0:2,'.');
      ReadLn(N);
    end;
end.