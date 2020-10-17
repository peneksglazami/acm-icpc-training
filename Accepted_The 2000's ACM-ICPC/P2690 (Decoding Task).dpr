{Problem: 2690 - Decoding Task
 ACM ICPC - Europe - Northeastern - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I+,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2690;
{$APPTYPE CONSOLE}
const
  MaxN = 10000;

var
  a,b,k: array [0..MaxN+1] of Byte;
  St: String;
  i,N: Integer;

function HexToByte(ch: Char): Byte;
begin
  if ch in ['0'..'9'] then
    HexToByte:=Ord(ch)-Ord('0')
  else
    HexToByte:=10+Ord(ch)-Ord('A');
end;

function ByteToHex(b: Byte): Char;
begin
  if b < 10 then
    ByteToHex:=Char(Ord('0')+b)
  else
    ByteToHex:=Char(Ord('A')+b-10);
end;

begin
  while not EOF do
    begin
      ReadLn(St);
      N:=Length(St) div 2;
      for i:=1 to N do
        a[i]:=HexToByte(St[2*i-1]) shl 4+HexToByte(St[2*i]);
      ReadLn(St);
      for i:=1 to N+1 do
        b[i]:=HexToByte(St[2*i-1]) shl 4+HexToByte(St[2*i]);
      a[0]:=32;
      for i:=1 to N+1 do
        begin
          k[i]:=a[i-1] xor b[i];
          a[i]:=k[i] xor a[i];
        end;
      for i:=1 to N+1 do
        Write(ByteToHex(k[i] shr 4),ByteToHex(k[i] mod 16));
      WriteLn;
    end;
end.