{Problem: 3519 - Hardwood Cutting
 ACM ICPC - Europe - Northeastern Europe & Russian Republic - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3519;
{$APPTYPE CONSOLE}
const
  MaxL = 20;

type
  Table = array [1..MaxL,1..MaxL] of Char;
  SSet = Set of Char;

var
  t: Table;
  i,j,n,m: Integer;

function Cut(t: Table; r1,c1,r2,c2: Integer): Integer;
var
  t1,t2: Table;
  r,c,i,j: Integer;
  TL,TR,BL,BR: SSet;
begin
  for r:=r1 to r2 do
    for c:=c1 to c2 do
      begin
        if (r = r2) and (c = c2) then
          Break;
        TL:=[]; TR:=[]; BL:=[]; BR:=[];
        for i:=r1 to r2 do
          for j:=c1 to c2 do
            if i <= r then
              if j <= c then
                TL:=TL+[t[i,j]]
              else
                TR:=TR+[t[i,j]]
            else
              if j <= c then
                BL:=BL+[t[i,j]]
              else
                BR:=BR+[t[i,j]];
        TL:=TL-[' '];
        TR:=TR-[' '];
        BL:=BL-[' '];
        BR:=BR-[' '];
        if (TL <> []) and (TR+BL+BR <> []) and (TL*(TR+BL+BR) = []) then
          begin
            t1:=t;
            t2:=t;
            for i:=r1 to r do
              for j:=c1 to c do
                t2[i,j]:=' ';
            Result:=Cut(t1,r1,c1,r,c)+Cut(t2,r1,c1,r2,c2);
            Exit;
          end;
        if (TR <> []) and (TL+BL+BR <> []) and (TR*(TL+BL+BR) = []) then
          begin
            t1:=t;
            t2:=t;
            for i:=r1 to r do
              for j:=c+1 to c2 do
                t2[i,j]:=' ';
            Result:=Cut(t1,r1,c+1,r,c2)+Cut(t2,r1,c1,r2,c2);
            Exit;
          end;
        if (BL <> []) and (TL+TR+BR <> []) and (BL*(TL+TR+BR) = []) then
          begin
            t1:=t;
            t2:=t;
            for i:=r+1 to r2 do
              for j:=c1 to c do
                t2[i,j]:=' ';
            Result:=Cut(t1,r+1,c1,r2,c)+Cut(t2,r1,c1,r2,c2);
            Exit;
          end;
        if (BR <> []) and (TL+TR+BL <> []) and (BR*(TL+TR+BL) = []) then
          begin
            t1:=t;
            t2:=t;
            for i:=r+1 to r2 do
              for j:=c+1 to c2 do
                t2[i,j]:=' ';
            Result:=Cut(t1,r+1,c+1,r2,c2)+Cut(t2,r1,c1,r2,c2);
            Exit;
          end;
      end;
  Result:=1;
end;

begin
  while not EOF do
    begin
      ReadLn(m,n);
      for i:=1 to m do
        begin
          for j:=1 to n do
            Read(t[i,j]);
          ReadLn;
        end;
      WriteLn(Cut(t,1,1,m,n));
    end;
end.