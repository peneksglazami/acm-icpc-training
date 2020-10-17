{Problem: 2291 - W's Cipher
 ACM ICPC - North America - Mid Central - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2291;
{$APPTYPE CONSOLE}
const
  MaxL = 80;

type
  CharSet = Set of Char;
  
var
  St: String;
  k1,k2,k3: Integer;

procedure Decrypt(V: CharSet; k: Integer; var St: String);
var
  a,b: array [1..MaxL] of Integer;
  c: array [1..MaxL] of Char;
  i,cnt: Integer;
begin
  cnt:=0;
  for i:=1 to Length(St) do
    if St[i] in V then
      begin
        Inc(cnt);
        a[cnt]:=i;
        c[cnt]:=St[i];
      end;
  for i:=1 to cnt do
    if (i+k) mod cnt = 0 then
      b[i]:=cnt
    else
      b[i]:=(i+k) mod cnt;
  for i:=1 to cnt do
    St[a[b[i]]]:=c[i];
end;

begin
  ReadLn(k1,k2,k3);
  while (k1 <> 0) or (k2 <> 0) or (k3 <> 0) do
    begin
      ReadLn(St);
      Decrypt(['a'..'i'],k1,St);
      Decrypt(['j'..'r'],k2,St);
      Decrypt(['s'..'z','_'],k3,St);
      WriteLn(St);
      ReadLn(k1,k2,k3);
    end;
end.