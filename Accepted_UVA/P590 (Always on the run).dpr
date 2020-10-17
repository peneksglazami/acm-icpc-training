{Problem: 590 - Always on the run
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem590 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 10;
  MaxK = 1000;
  MaxD = 30;

Var
  a: Array [1..MaxK,1..MaxN,1..MaxN] of Integer;
  b: Array [0..MaxK,1..MaxN] of Integer;
  dd: Array [1..MaxD] of Integer;
  i,j,g,gg,N,K,d,n_case: Integer;

Begin
  n_case:=0;
  ReadLn(N,K);
  While (N <> 0) or (K <> 0) do
    Begin
      FillChar(a,SizeOf(a),0);
      for i:=1 to N do
        for j:=1 to N-1 do
          Begin
            Read(d);
            for g:=1 to d do
              Read(dd[g]);
            ReadLn;
            g:=1;
            gg:=1;
            While gg <= K do
              Begin
                if j >= i then
                  a[gg,i,j+1]:=dd[g]
                else
                  a[gg,i,j]:=dd[g];
                Inc(gg);
                if g < d then
                  Inc(g)
                else
                  g:=1;
              end;
          end;
      for i:=0 to K do
        for j:=1 to N do
          b[i,j]:=-1;
      b[0,1]:=0;
      for i:=0 to k-1 do
        for j:=1 to N do
          if b[i,j] <> -1 then
            for g:=1 to N do
              if a[i+1,j,g] > 0 then
                if b[i+1,g] = -1 then
                  b[i+1,g]:=b[i,j]+a[i+1,j,g]
                else
                  if b[i+1,g] > b[i,j]+a[i+1,j,g] then
                    b[i+1,g]:=b[i,j]+a[i+1,j,g];
      Inc(n_case);
      WriteLn('Scenario #',n_case);
      if b[K,N] <> -1 then
        WriteLn('The best flight costs ',b[K,N],'.')
      else
        WriteLn('No flight possible.');
      WriteLn;
      ReadLn(N,K);
    end;
end.