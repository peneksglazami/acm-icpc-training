{Problem: 3108 - Filling Out the Team
 ACM ICPC - North America - Mid Atlantic - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3108;
{$APPTYPE CONSOLE}
const
  name: array [1..3] of String = ('Wide Receiver','Lineman','Quarterback');
  min: array [1..3,1..3] of Double = ((4.5, 150, 200),
                                      (6.0, 300, 500),
                                      (5.0, 200, 300));

var
  speed,weight,strength: Double;
  i: Integer;
  ok: Boolean;

begin
  ReadLn(speed,weight,strength);
  while (speed <> 0.0) or (weight <> 0.0) or (strength <> 0.0) do
    begin
      ok:=False;
      for i:=1 to 3 do
        if (speed <= min[i, 1]) and (weight >= min[i, 2]) and (strength >= min[i, 3]) then
          begin
            Write(name[i],' ');
            ok:=True;
          end;
      if not ok then
        Write('No positions');
      WriteLn;
      ReadLn(speed,weight,strength);
    end;
end.