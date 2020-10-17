{Problem: 2488 - Maze Madness
 ACM ICPC - Oceania - South Pacific - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2488;
{$APPTYPE CONSOLE}
const
  dir: array [1..4,1..2] of Integer = ((1,0),(0,1),(-1,0),(0,-1));
  dir2: array [1..4,1..2] of Integer = ((2,0),(0,2),(-2,0),(0,-2));
  MaxL = 201;

var
  s1,s2: array [1..MaxL*MaxL] of record r,c: Integer; end;
  t: array [0..MaxL+1,0..MaxL+1] of Boolean;
  d: array [0..MaxL+1,0..MaxL+1] of Integer;
  i,j,N,M,R,C,sr,sc,ss1,ss2,n_case,Best: Integer;
  St: String;
  Find: Boolean;

begin
  n_case:=0;
  ReadLn(M,N);
  while (N <> 0) or (M <> 0) do
    begin
      Inc(n_case);
      Write('Maze ',n_case,': ');
      R:=2*N+1;
      C:=2*M+1;
      FillChar(t,SizeOf(t),True);
      for i:=1 to R do
        begin
          ReadLn(St);
          for j:=1 to C do
            case St[j] of
              '|','-','+': t[i,j]:=False;
              ' ','.': t[i,j]:=True;
              's': begin
                     t[i,j]:=True;
                     sr:=i;
                     sc:=j;
                   end;
            end;
        end;
      for i:=0 to R+1 do
        for j:=0 to C+1 do
          d[i,j]:=-1;
      ss1:=1;
      s1[1].r:=sr;
      s1[1].c:=sc;
      Find:=False;
      d[sr,sc]:=0;
      repeat
        s2:=s1;
        ss2:=ss1;
        ss1:=0;
        for i:=1 to ss2 do
          for j:=1 to 4 do
            if t[s2[i].r+dir[j,1],s2[i].c+dir[j,2]] and t[s2[i].r+dir2[j,1],s2[i].c+dir2[j,2]] and
              (d[s2[i].r+dir2[j,1],s2[i].c+dir2[j,2]] = -1) then
              begin
                Inc(ss1);
                s1[ss1].r:=s2[i].r+dir2[j,1];
                s1[ss1].c:=s2[i].c+dir2[j,2];
                d[s2[i].r+dir2[j,1],s2[i].c+dir2[j,2]]:=d[s2[i].r,s2[i].c]+1;
                if (s1[ss1].r = 0) or (s1[ss1].r = R+1) or
                   (s1[ss1].c = 0) or (s1[ss1].c = C+1) then
                     begin
                       Find:=True;
                       Best:=d[s2[i].r+dir2[j,1],s2[i].c+dir2[j,2]];
                     end;
              end;
      until Find or (ss1 = 0);
      if Find then
        WriteLn(Best)
      else
        WriteLn('No escape!');
      ReadLn(M,N);
    end;
end.