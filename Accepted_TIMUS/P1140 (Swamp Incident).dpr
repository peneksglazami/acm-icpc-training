{ACM ICPC 2001-2002 ACM ICPC Central Region of Russia Quarterfinal Programming Contest
 Problem H - Swamp Incident
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program ProblemH;
{$APPTYPE CONSOLE}
const
  MaxL = 100000;
  dir1: array [1..6,1..3] of Integer = ((1,0,0),(-1,0,0),
                                         (0,1,0),(0,-1,0),
                                         (0,0,1),(0,0,-1));
  dir2: array [1..6,1..3] of Integer = ((0,-1,1),(0,1,-1),
                                         (-1,0,-1),(1,0,1),
                                         (1,-1,0),(-1,1,0));
var
  s1,s2: array [1..MaxL,1..3] of Integer;
  i,j,N,l,x,y,z,ss1,ss2,min: Integer;
  Ch: Char;

function Len(x,y,z: Integer): Integer;
begin
  Len:=Abs(x)+Abs(y)+Abs(z);
end;

begin
  ReadLn(N);
  for i:=1 to N do
    begin
      Read(Ch);
      ReadLn(l);
      case Ch of
        'X': inc(x,l);
        'Y': inc(y,l);
        'Z': inc(z,l);
      end;
    end;
  ss1:=1;
  s1[1][1]:=x;
  s1[1][2]:=y;
  s1[1][3]:=z;
  repeat
    s2:=s1;
    ss2:=ss1;
    ss1:=0;
    min:=Len(s2[1,1],s2[1,2],s2[1,3])-1;
    for i:=1 to ss2 do
      for j:=1 to 6 do
        begin
          if ss1 = MaxL then
            Continue;
          l:=Len(s2[i,1]+dir1[j,1]+dir2[j,1],s2[i,2]+dir1[j,2]+dir2[j,2],s2[i,3]+dir1[j,3]+dir2[j,3]);
          if l <= min then
            begin
              if l < min then
                begin
                  ss1:=0;
                  min:=l;
                end;
              inc(ss1);
              s1[ss1,1]:=s2[i,1]+dir1[j,1]+dir2[j,1];
              s1[ss1,2]:=s2[i,2]+dir1[j,2]+dir2[j,2];
              s1[ss1,3]:=s2[i,3]+dir1[j,3]+dir2[j,3];
              x:=s2[i,1]+dir1[j,1]+dir2[j,1];
              y:=s2[i,2]+dir1[j,2]+dir2[j,2];
              z:=s2[i,3]+dir1[j,3]+dir2[j,3];
            end;
        end;
  until ss1 = 0;
  N:=0;
  if x <> 0 then
    inc(N);
  if y <> 0 then
    inc(N);
  if z <> 0 then
    inc(N);
  WriteLn(N);
  if x <> 0 then
    WriteLn('X ',-x);
  if y <> 0 then
    WriteLn('Y ',-y);
  if z <> 0 then
    WriteLn('Z ',-z);
end.