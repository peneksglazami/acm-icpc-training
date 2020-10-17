{ACM ICPC 2004-2004, Northeastern European Regional Contest
 Problem A - Ancient Cipher
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem3213;
{$APPTYPE CONSOLE}
Var
  A,B: Array [0..100] of Byte;
  X: Array ['A'..'Z'] of Byte;
  St: String;
  Ch: Char;
  Ok: Boolean;
  i: Integer;

Begin
  While not EOF do
    Begin
      FillChar(A,SizeOf(A),0);
      FillChar(B,SizeOf(B),0);
      FillChar(X,SizeOf(X),0);
      ReadLn(St);
      for i:=1 to Length(St) do
        Inc(X[St[i]]);
      for Ch:='A' to 'Z' do
        Inc(A[X[Ch]]);
      FillChar(X,SizeOf(X),0);
        ReadLn(St);
      for i:=1 to Length(St) do
        Inc(X[St[i]]);
      for Ch:='A' to 'Z' do
        Inc(B[X[Ch]]);
      Ok:=True;
      i:=1;
      While Ok and (i <= 100) do
        Begin
          Ok:=(A[i] = B[i]);
          Inc(i);
        end;
      if Ok then
        WriteLn('YES')
      else
        WriteLn('NO');
    end;
end.