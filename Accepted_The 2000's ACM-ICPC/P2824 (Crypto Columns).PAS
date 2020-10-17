{Problem: 2824 - Crypto Columns
 Problem A - ACM ICPC 2003-2004 North America - East Central Region
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2824 (input,output);
Var
  a: Array [1..100,1..10] of Char;
  b,d: Array [1..10] of Byte;
  CC,St: String;
  i,j,N,buf,C,R: Integer;
  bufCh: Char;

Begin
  ReadLn(CC);
  While CC <> 'THEEND' do
    Begin
      ReadLn(St);
      C:=Length(CC);
      R:=Length(St) div C;
      for i:=1 to C do
        for j:=1 to R do
          a[j,i]:=St[(i-1)*R+j];
      for i:=1 to C do
        b[i]:=i;
      for i:=1 to C-1 do
        for j:=i+1 to C do
          if (CC[i] > CC[j]) or ((CC[i] = CC[j]) and (b[i] > b[j])) then
            Begin
              bufCh:=CC[i]; CC[i]:=CC[j]; CC[j]:=bufCh;
              buf:=b[i]; b[i]:=b[j]; b[j]:=buf;
            end;
      for i:=1 to C do
        d[b[i]]:=i;
      for i:=1 to R do
        for j:=1 to C do
          Write(a[i,d[j]]);
      WriteLn;
      ReadLn(CC);
    end;
end.