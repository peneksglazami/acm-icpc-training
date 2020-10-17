{Problem: 2250 - Encryption Scheme
 ACM ICPC - Oceania - South Pacific - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2250;
{$APPTYPE CONSOLE}
const
  INFINITY = MaxInt div 2;
  MaxL = 120;

var
  d: array [1..MaxL+1,1..MaxL+1] of Integer;
  K,P,S: String;
  i,j,m,LenK,LenP,LenS: Integer;

procedure Trim(var St: String);
begin
  while St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

begin
  ReadLn(K);
  while K <> '#' do
    begin
      ReadLn(P);
      Trim(P);
      LenK:=Length(K);
      LenP:=Length(P);
      for i:=1 to LenP+1 do
        for j:=1 to LenP+1 do
          d[i,j]:=INFINITY;
      LenS:=1;
      while (LenS <= LenK) and (LenS <= LenP) do
        begin
          for i:=1 to LenP-LenS+1 do
            begin
              S:=Copy(P,i,LenS);
              if Pos(S,K) <> 0 then
                d[i,i+LenS]:=1;
            end;
          Inc(LenS);
        end;
      for m:=1 to LenP+1 do
        for i:=1 to LenP+1 do
          for j:=1 to LenP+1 do
            if d[i,j] > d[i,m]+d[m,j] then
              d[i,j]:=d[i,m]+d[m,j];
      WriteLn(d[1,LenP+1]);
      ReadLn(K);
      Trim(K);
    end;
end.