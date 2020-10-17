{ACM ICPC 2003-2004 South Pacific
 Problem B - CD Titles
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2732 (input, output);
Var
  St: Array [1..50] of String[100];
  S: String;
  i,j,g: Integer;

Begin
  ReadLn(S);
  i:=0;
  While S <> '#' do
    Begin
      Inc(i);
      While Length(S) < 36 do
        S:=S+' ';
      St[i]:=S;
      ReadLn(S);
    end;
  for j:=1 to 2*i+1 do
    Write('-');
  WriteLn;
  for j:=1 to 36 do
    Begin
      S:='|';
      for g:=1 to i do
        S:=S+St[g,j]+'|';
      WriteLn(S);
    end;
  for j:=1 to 2*i+1 do
    Write('-');
  WriteLn;
end.