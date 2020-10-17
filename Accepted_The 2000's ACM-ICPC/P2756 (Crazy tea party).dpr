{ACM ICPC 2003-2004 Southeastern European Regional Contest
 Problem C - Crazy tea party
 Solved by Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program ProblemC;
Var
  i,T,n,a,b,S: Integer;

Begin
  ReadLn(T);
  for i:=1 to T do
    Begin
      ReadLn(n);
      a:=n div 2;
      b:=n-a;
      S:=(a*(a-1) div 2)+(b*(b-1) div 2);
      WriteLn(S);
    end;
end.
