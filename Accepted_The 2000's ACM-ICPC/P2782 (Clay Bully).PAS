{ACM ICPC 2003/2004 North America - Mid Central
 Problem A - Clay Bully
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA (input, output);
Type
  Child = Record
    Name: String;
    S: Word;
   end;

Var
  S: Array [1..9] of Child;
  Change: Child;
  i,j,N,a,b,c: Integer;
  St: String;

Begin
  ReadLn(N);
  While N <> -1 do
    Begin
      for i:=1 to N do
        Begin
          ReadLn(a,b,c,St);
          S[i].S:=a*b*c;
          While St[1] = ' ' do
            Delete(St,1,1);
          S[i].Name:=St;
        end;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if S[i].S < S[j].S then
            Begin
              Change:=S[i];
              S[i]:=S[j];
              S[j]:=Change;
            end;
      WriteLn(S[1].Name,' took clay from ',S[N].Name,'.');
      ReadLn(N);
    end;
end.