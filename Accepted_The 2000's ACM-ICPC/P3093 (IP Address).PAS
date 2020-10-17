{ACM ICPC 2004/2005 Latin America - Mexico and Central America
 Problem A - IP Address
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program ProblemA (input, output);
Var
  N: Integer;
  St: Array [1..4] of String[8];


Function ToByte(St: String): Byte;
Const
  Degrees: Array [1..8] of Byte = (1,2,4,8,16,32,64,128);
Var
  i,S: Integer;

Begin
  S:=0;
  for i:=1 to 8 do
    if St[8-i+1] = '1' then
      S:=S+Degrees[i];
  ToByte:=S;
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      ReadLn(St[1],St[2],St[3],St[4]);
      WriteLn(ToByte(St[1]),'.',ToByte(St[2]),'.',ToByte(St[3]),'.',ToByte(St[4]));
      Dec(N);
    end;
end.