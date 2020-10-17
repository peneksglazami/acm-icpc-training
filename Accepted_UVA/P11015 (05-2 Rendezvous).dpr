{Problem: 11015 - 05-2 Rendezvous
 Problem setter: Timotius Sakti
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S+,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program P11014 (input, output);
Var
  a: Array [1..22,1..22] of Integer;
  st: Array [1..22] of String;
  Sum,i,j,min,i_min,x,y,l,n,m,n_case: Integer;

Begin
  ReadLn(N,M);
  While (N <> 0) or (M <> 0) do
    Begin
      inc(n_case);
      for i:=1 to N do
        ReadLn(St[i]);
      for i:=1 to N do
        for j:=1 to N do
          a[i,j]:=MaxInt div 2;
      for i:=1 to N do
        a[i,i]:=0;
      for i:=1 to M do
        Begin
          ReadLn(x,y,l);
          a[x,y]:=l;
          a[y,x]:=l;
        end;
      for m:=1 to N do
        for i:=1 to N do
          for j:=1 to N do
            if a[i,j] > a[i,m]+a[m,j] then
               a[i,j]:=a[i,m]+a[m,j];
      min:=MaxInt;
      i_min:=0;
      for i:=1 to N do
        begin
          Sum:=0;
          for j:=1 to N do
            Inc(Sum,a[i,j]);
          if Sum < min then
            begin
              min:=Sum;
              i_min:=i;
            end;
        end;
      WriteLn('Case #',n_case,' : ',St[i_min]);
      ReadLn(N,M);
    end;
end.