{ACM ICPC 2004/2005 North America - East Central
 Problem G - To and Fro
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program ProblemG (input, output);
Var
  T: Array [1..100,1..20] of Char;
  St: String;
  i,j,g,C,R: Integer;

Begin
  ReadLn(C);
  While C <> 0 do
    Begin
      ReadLn(St);
      R:=Length(St) div C;
      g:=1;
      for i:=1 to R do
        for j:=1 to C do
          Begin
            if i mod 2 = 0 then
              T[i,C-j+1]:=St[g]
            else
              T[i,j]:=St[g];
            Inc(g);
          end;
      St:='';
      for i:=1 to C do
        for j:=1 to R do
          St:=St+T[j,i];
      WriteLn(St);
      ReadLn(C);
    end;
end.