{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10400 (input, output);
{$APPTYPE CONSOLE}
Var
  A: Array [1..100] of LongInt;
  Mas: Array [1..100] of Char;
  Table: Array [1..100,-32000..32000] of Boolean;
  i,j,N,P,R: Integer;
  Ok: Boolean;

Procedure Rec(V,Number: LongInt);
Var
  K: Integer;
Begin
  if (Number-1 = P) and (V = R) then
    Ok:=True;
  if not OK and (Number <= P) then
    Begin
      if not Ok and (V + A[Number] <= 32000) then
        Begin
          K:=V+A[Number];
          if not Table[Number,K] then
            Begin
              Mas[Number-1]:='+';
              Table[Number,K]:=True;
              Rec(K,Number+1);
            end;
        end;
      if not Ok and (V - A[Number] >= -32000) then
        Begin
          K:=V-A[Number];
          if not Table[Number,K] then
            Begin
              Mas[Number-1]:='-';
              Table[Number,K]:=True;
              Rec(K,Number+1);
            end;
        end;
      if not Ok and (V*A[Number] >= -32000) and (V*A[Number] <= 32000) then
        Begin
          K:=V*A[Number];
          if not Table[Number,K] then
            Begin
              Mas[Number-1]:='*';
              Table[Number,K]:=True;
              Rec(K,Number+1);
            end;
        end;
      if not Ok and (V mod A[Number] = 0) then
        Begin
          K:=V div A[Number];
          if not Table[Number,K] then
            Begin
              Mas[Number-1]:='/';
              Table[Number,K]:=True;
              Rec(K,Number+1);
            end;
        end;
    end;
end;

Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      Read(P);
      for j:=1 to P do
        Read(A[j]);
      ReadLn(R);
      Ok:=False;
      FillChar(Table,SizeOf(Table),False);
      Rec(A[1],2);
      if Ok then
        Begin
          for j:=1 to P-1 do
            Write(A[j],Mas[j]);
          WriteLn(A[P],'=',R);
        end
      else
        WriteLn('NO EXPRESSION');
    end;
end.