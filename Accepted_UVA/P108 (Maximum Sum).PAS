{Problem: 108 - Maximum Sum
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem108 (input,output);
Const
  MaxN = 100;

Var
  a: Array [1..MaxN,1..MaxN] of Integer;
  b: Array [0..MaxN,0..MaxN] of Integer;
  i,j,i1,i2,j1,j2,N,max: Integer;

Begin
  ReadLn(N);
  for i:=1 to N do
    for j:=1 to N do
      Read(a[i,j]);
  for i:=1 to N do
    for j:=1 to N do
      b[i,j]:=b[i-1,j]+b[i,j-1]-b[i-1,j-1]+a[i,j];
  max:=a[1,1];
  for i1:=1 to N do
    for j1:=1 to N do
      for i2:=i1 to N do
        for j2:=j1 to N do
          if max < b[i2,j2]-b[i1-1,j2]-b[i2,j1-1]+b[i1-1,j1-1] then
            max:=b[i2,j2]-b[i1-1,j2]-b[i2,j1-1]+b[i1-1,j1-1];
  WriteLn(max);
end.