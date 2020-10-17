{Problem: 10496 - Collecting Beepers
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10496 (input, output);
Var
  D: Array [1..11,1..11] of Integer;
  B: Array [1..11] of Record X,Y: Integer; end;
  M: Array [1..11] of Boolean;
  i,j,Test,N,X,Y,MinL: Integer;

Procedure Find(v,k,L: Integer);
Var
  j: Integer;
Begin
  Inc(k);
  if (k = N+2) then
    Begin
      if (v = 1) then
        MinL:=L;
      Exit;
    end;
  if k <= N then
    Begin
      for j:=2 to N+1 do
        if M[j] then
          if L+D[v,j] < MinL then
            Begin
              M[j]:=False;
              Find(j,k,L+D[v,j]);
              M[j]:=True;
            end;
    end
  else
    if L+D[v,1] < MinL then
      Find(1,k,L+D[v,1]);
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      FillChar(D,SizeOf(D),0);
      ReadLn(X,Y);
      ReadLn(B[1].X,B[1].Y);
      ReadLn(N);
      for i:=1 to N do
        ReadLn(B[i+1].X,B[i+1].Y);
      for i:=1 to N do
        for j:=i+1 to N+1 do
          Begin
            D[i,j]:=Abs(B[i].X-B[j].X)+Abs(B[i].Y-B[j].Y);
            D[j,i]:=D[i,j];
          end;
      MinL:=MaxInt;
      FillChar(M,SizeOf(M),True);
      Find(1,0,0);
      WriteLn('The shortest path has length ',MinL);
      Dec(Test);
    end;
end.