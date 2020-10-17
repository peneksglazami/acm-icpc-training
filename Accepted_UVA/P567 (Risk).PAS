{Problem: 567 - Risk
 Author: Miguel A. Revilla
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem567 (input, output);
Var
  D: Array [1..20,1..20] of Integer;
  i,j,m,n_case,s,f,N,X,Y: Integer;

Begin
  n_case:=1;
  While not EOF do
    Begin
      for i:=1 to 20 do
        for j:=1 to 20 do
          D[i,j]:=MaxInt div 2;
      for i:=1 to 20 do
        D[i,i]:=0;
      for i:=1 to 19 do
        Begin
          Read(X);
          for j:=1 to X do
            Begin
              Read(Y);
              D[i,Y]:=1;
              D[Y,i]:=1;
            end;
        end;
      for m:=1 to 20 do
        for i:=1 to 20 do
          for j:=1 to 20 do
            if D[i,j] > D[i,m]+D[m,j] then
              D[i,j]:=D[i,m]+D[m,j];
      ReadLn(N);
      WriteLn('Test Set #',n_case);
      for i:=1 to N do
        Begin
          ReadLn(s,f);
          if s < 10 then
            Write(' ');
          Write(s,' to ');
          if f < 10 then
            Write(' ');
          WriteLn(f,': ',D[s,f]);
        end;
      WriteLn;
      Inc(n_case);
    end;
end.