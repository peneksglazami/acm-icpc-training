{Problem: 10192 - Vacation
 Problem E - Internal Contest Warmup 2001
 Source: 2001 Universidade do Brasil (UFRJ)
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem10192 (input, output);
Var
  Table: Array [0..100,0..100] of Byte;
  S1,S2: String [100];
  i,j,N1,N2,n_case: Integer;

Function Max(a,b: Byte): Byte;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Begin
  ReadLn(S1);
  n_case:=1;
  While S1[1] <> '#' do
    Begin
      FillChar(Table,SizeOf(Table),0);
      N1:=Length(S1);
      ReadLn(S2);
      N2:=Length(S2);
      for i:=1 to N1 do
        for j:=1 to N2 do
          if (S1[i] = S2[j]) then
            Table[i,j]:=Max(Table[i-1,j-1]+1,Max(Table[i-1,j],Table[i,j-1]))
          else
            Table[i,j]:=Max(Table[i-1,j],Table[i,j-1]);
      WriteLn('Case #',n_case,': you can visit at most ',Table[N1,N2],' cities.');
      Inc(n_case);
      ReadLn(S1);
    end;
end.