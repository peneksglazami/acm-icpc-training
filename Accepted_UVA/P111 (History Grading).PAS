{Problem: 111 - History Grading
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem111 (input, output);
Var
  Correct,Answer,L: Array [1..20] of Byte;
  i,j,a,N,Max: Integer;

Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      Read(a);
      Correct[i]:=a;
    end;
  ReadLn;
  While not EOF do
    Begin
      i:=1;
      While (i <= N) do
        Begin
          Read(a);
          Answer[a]:=i;
          Inc(i);
        end;
      ReadLn;
      FillChar(L,SizeOf(L),1);
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if Correct[Answer[j]] > Correct[Answer[i]] then
            if L[i]+1 > L[j] then
              L[j]:=L[i]+1;
      Max:=1;
      for i:=1 to N do
        if L[i] > Max then
          Max:=L[i];
      WriteLn(Max);
    end;
end.