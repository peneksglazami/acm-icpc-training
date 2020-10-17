{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
program Problem4044;
{$APPTYPE CONSOLE}
var
  a: array [1..2, 1..50, 1..50] of Char;
  i, j, g, N: Integer;

function toCh(i: Integer): Char;
begin
  if i <= 26 then
    Result := Chr(Ord('A') + i - 1)
  else
    Result := Chr(Ord('a') + i - 26 - 1);
end;

begin
  while not EOF do
    begin
      ReadLn(N);
      for i := 1 to N do
        for j := 1 to N do
          a[1, i, j] := toCh(i);
      for i := 1 to N do
        for j := 1 to N do
          a[2, i, j] := toCh(j);
      WriteLn(2, ' ', N, ' ', N);
      for i := 1 to 2 do
        begin
          for j := 1 to N do
            begin
              for g := 1 to N do
                Write(a[i, j, g]);
              WriteLn;
            end;
          if i = 1 then
            WriteLn;
        end;
      if not EOF then
        WriteLn;
    end;
end.