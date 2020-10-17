{Problem: 10302 - Summations of Polynomials
 The Joint Effort Contest
 Problem setter: Rodrigo Malta Schmidt
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10302 (input,output);
{$APPTYPE CONSOLE}
Var
  N: Int64;

Begin
  While not EOF do
    Begin
      ReadLn(N);
      WriteLn(((N*(N+1)) div 2)*((N*(N+1)) div 2));
    end;
end.
