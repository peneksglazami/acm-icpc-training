{ACM ICPC 2003-2004 South Pacific
 Problem A - Wacmian Numbers
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2731 (input, output);
Var
  A: Array [0..10] of LongInt;
  St: String;
  i,N: LongInt;

Function ToInt(Ch: Char): LongInt;
Begin
  Case Ch of
    '%': ToInt:=0;
    ')': ToInt:=1;
    '~': ToInt:=2;
    '@': ToInt:=3;
    '?': ToInt:=4;
    '\': ToInt:=5;
    '$': ToInt:=-1;
   end;
end;

Begin
  A[0]:=1;
  for i:=1 to 10 do
    A[i]:=A[i-1]*6;
  ReadLn(St);
  While St <> '#' do
    Begin
      N:=0;
      for i:=1 to Length(St) do
        N:=N+A[Length(St)-i]*ToInt(St[i]);
      WriteLn(N);
      ReadLn(St);
    end;
end.