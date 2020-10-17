{Problem: 11244 - Counting Stars
 Problemsetter: Shahriar Manzoor
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem11244;
{$APPTYPE CONSOLE}
const
  MaxRC = 100;
  dir: array [1..8, 1..2] of Integer = ((0, -1), (1, -1), (1, 0), (1, 1),
                                       (0, 1), (-1, 1), (-1, 0), (-1, -1));

var
  t: array [0..MaxRC+1, 0..MaxRC+1] of Char;
  i, j, g, R, C, cnt: Integer;
  Ok: Boolean;

begin
  ReadLn(R, C);
  while (R <> 0) or (C <> 0) do
    begin
      FillChar(t, SizeOf(t), '.');
      for i := 1 to R do
        begin
          for j := 1 to C do
            Read(t[i, j]);
          ReadLn;
        end;
      cnt := 0;
      for i := 1 to R do
        for j := 1 to C do
          if t[i, j] = '*' then
            begin
              Ok := True;
              for g := 1 to 8 do
                if t[i+dir[g, 1], j+dir[g, 2]] = '*' then
                  begin
                    Ok := False;
                    Break;
                  end;
              if Ok then
                inc(cnt);
            end;
      WriteLn(cnt);
      ReadLn(R, C);
    end;
end.