{Problem: 2509 - Cash Machine
 ACM ICPC - Europe - Southeastern - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2509;
{$APPTYPE CONSOLE}
const
  MaxCash = 100000;
  MaxN = 10;

var
  a: array [0..MaxCash] of Boolean;
  q1,q2: array [0..MaxCash] of Integer;
  n,d: array [1..MaxN] of Integer;
  i,j,g,cash,nd,sum: Integer;

begin
  while not EOF do
    begin
      Read(cash,nd);
      Sum:=0;
      for i:=1 to nd do
        begin
          Read(n[i],d[i]);
          Inc(Sum,n[i]*d[i]);
        end;
      ReadLn;
      if Sum <= cash then
        begin
          WriteLn(Sum);
          continue;
        end;
      FillChar(a,SizeOf(a),False);
      a[0]:=True;
      q1[0]:=1;
      q1[1]:=0;
      for i:=1 to nd do
        begin
          q2:=q1;
          for j:=1 to q2[0] do
            for g:=1 to n[i] do
              if q2[j]+g*d[i] > cash then
                break
              else
                if not a[q2[j]+g*d[i]] then
                  begin
                    a[q2[j]+g*d[i]]:=True;
                    Inc(q1[0]);
                    q1[q1[0]]:=q2[j]+g*d[i];
                  end;
          if a[cash] then
            break;
        end;
      i:=cash;
      while not a[i] do
        Dec(i);
      WriteLn(i);
    end;
end.