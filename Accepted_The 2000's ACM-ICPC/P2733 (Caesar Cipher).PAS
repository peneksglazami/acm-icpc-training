{ACM ICPC 2003-2004 South Pacific
 Problem C - Caesar Cipher
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2733 (input, output);
Const
  ABCUp: String = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  ABCLow: String = 'abcdefghijklmnopqrstuvwxyz';
  Num: String = '0123456789';

Var
  St: String;
  i,Er: Integer;
  N: LongInt;

Begin
  ReadLn(St);
  While St <> '#' do
    Begin
      Val(Copy(St,1,Pos(':',St)-1),N,Er);
      Delete(St,1,Pos(':',St));
      for i:=1 to Length(St) do
        Begin
          if St[i] in ['0'..'9'] then
            if N >= 0 then
              St[i]:=Num[(Pos(St[i],Num)-1+N mod 10) mod 10+1]
            else
              St[i]:=Num[(9+Pos(St[i],Num)-Abs(N) mod 10) mod 10+1];
          if St[i] in ['A'..'Z'] then
            if N >= 0 then
              St[i]:=ABCUp[(Pos(St[i],ABCUp)-1+N mod 26) mod 26+1]
            else
              St[i]:=ABCUp[(25+Pos(St[i],ABCUp)-Abs(N) mod 26) mod 26+1];
          if St[i] in ['a'..'z'] then
            if N >= 0 then
              St[i]:=ABCLow[(Pos(St[i],ABCLow)-1+N mod 26) mod 26+1]
            else
              St[i]:=ABCLow[(25+Pos(St[i],ABCLow)-Abs(N) mod 26) mod 26+1];
        end;
      WriteLn(St);
      ReadLn(St);
    end;
end.