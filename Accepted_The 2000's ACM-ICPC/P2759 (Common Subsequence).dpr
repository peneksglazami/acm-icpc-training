{ACM ICPC 2003-2004 Southeastern European Regional Contest
 Problem F - Common Subsequence
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program ProblemF;
Type
  Mas = Array [1..255] of Char;

Var
  T: Array [1..2,0..255] of Integer;
  S1,S2: Mas;
  i,j,L1,L2: Integer;
  Ch: Char;

Function Max(a,b: Integer): Integer;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Begin
  While not EOF do
    Begin
      Ch:='a';
      L1:=0;
      While (Ch in ['a'..'z']) and not EOLn do
        Begin
          Read(Ch);
          if (Ch in ['a'..'z']) then
            Begin
              Inc(L1);
              S1[L1]:=Ch;
            end;
        end;
      if EOLn then
        ReadLn;
      L2:=0;
      While not (Ch in ['a'..'z']) and not EOLn do
        Begin
          Read(Ch);
          if (Ch in ['a'..'z']) then
            Begin
              Inc(L2);
              S2[L2]:=Ch;
            end;
        end;
      While (Ch in ['a'..'z']) and not EOLn do
        Begin
          Read(Ch);
          if (Ch in ['a'..'z']) then
            Begin
              Inc(L2);
              S2[L2]:=Ch;
            end;
        end;
      ReadLn;
      FillChar(T,SizeOf(T),0);
      for i:=1 to L1 do
        Begin
          FillChar(T[2],SizeOf(T[2]),0);
          for j:=1 to L2 do
            if S1[i] = S2[j] then
              T[2,j]:=Max(T[1,j-1]+1,Max(T[2,j-1],T[1,j]))
            else
              T[2,j]:=Max(T[2,j-1],T[1,j]);
          T[1]:=T[2];
        end;
      WriteLn(T[2,L2]);
    end;
end.