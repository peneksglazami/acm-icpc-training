{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10405 (input, output); {Longest Common Subsequence}
{$APPTYPE CONSOLE}
Var
  Table: Array [1..1000,1..1000] of Integer;
  A,B: Array [1..1000] of Char;
  i,j,L1,L2: Integer;
  Ok: Boolean;

Function Max(A,B: Integer): Integer;
Begin
  if A > B then
    Max:=A
  else
    Max:=B;
end;

Begin
  While not EOF do
    Begin
      FillChar(Table,SizeOf(Table),0);
      L1:=0;
      While not EOLn do
        Begin
          Read(A[L1+1]);
          Inc(L1);
        end;
      ReadLn;
      L2:=0;
      While not EOLn do
        Begin
          Read(B[L2+1]);
          Inc(L2);
        end;
      ReadLn;
      Ok:=False;
      for i:=1 to L1 do
        Begin
          if (A[i] = B[1]) then
            Ok:=True;
          if Ok then
            Table[i,1]:=1;
        end;
      Ok:=False;
      for j:=1 to L2 do
        Begin
          if (A[1] = B[j]) then
            Ok:=True;
          if Ok then
            Table[1,j]:=1;
        end;
      for i:=2 to L1 do
        for j:=2 to L2 do
          if A[i] = B[j] then
            Table[i,j]:=Max(Table[i-1,j-1]+1,Max(Table[i-1,j],Table[i,j-1]))
          else
            Table[i,j]:=Max(Table[i-1,j],Table[i,j-1]);
      WriteLn(Table[L1,L2]);
    end;
end.
