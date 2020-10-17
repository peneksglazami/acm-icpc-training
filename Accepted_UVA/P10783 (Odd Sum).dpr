{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S+,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem (input, output);
{$APPTYPE CONSOLE}
Var
  i,j,A,B,T,n_case,S: Integer;
Begin
  ReadLn(T);
  n_case:=1;
  While T > 0 do
    Begin
      ReadLn(A);
      ReadLn(B);
      if A < B then
        Begin
          if not Odd(A) then
            Inc(A);
          if not Odd(B) then
            Dec(B);
          S:=(A+B)*((B-A) div 2+1) div 2;
         end
      else
        if Odd(A) then
          S:=A
        else
          S:=0;
      WriteLn('Case ',n_case,': ',S);
      Inc(n_case);
      Dec(T);
    end;
end.
