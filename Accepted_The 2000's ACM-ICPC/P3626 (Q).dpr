{Problem: 3626 - Q
 ACM ICPC - North America - South Central - 2006/2007
 Solve by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program Problem3626;
{$APPTYPE CONSOLE}
const
  MaxM = 20;

var
  a, b: array [1..MaxM] of String;
  St: String;
  i, j, N, M, test, s, r: Integer;

begin
  ReadLn(test);
  while test > 0 do
    begin
      ReadLn(M, N);
      ReadLn(St);
      St := St + ' ';
      for i := 1 to M do
        begin
          a[i] := Copy(St, 1, Pos(' ', St) - 1);
          b[i] := '';
          Delete(St, 1, Pos(' ', St));
        end;
      for i := 1 to N do
        begin
          ReadLn(s, r);
          b[r] := a[s];
          a[s] := '';
        end;
      i := 1;
      j := 1;
      St := '';
      while (i <= M) or (j <= M) do
        begin
          if (i <= M) and (b[i] <> '') then
            St := St + b[i] + ' '
          else
            begin
              while (j <= M) and (a[j] = '') do
                inc(j);
              if j <= M then
                begin
                  St := St + a[j] + ' ';
                  inc(j);
                end;
            end;
          inc(i);
        end;
      Delete(St, Length(St), 1);
      WriteLn(St);
      dec(test);
    end;
end.
