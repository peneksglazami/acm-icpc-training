{Problem: 11170 - Cos(NA)
 Problem setter: Shahriar Manzoor
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program P_F;
{$APPTYPE CONSOLE}
type
  mas = array [0..50] of Int64;

var
  t: array [0..50] of mas;
  b: array [0..50] of Boolean;
  a: mas;
  N,i: Integer;
  first: Boolean;

procedure Rec(n: Integer; var m: mas);
var
  m1,m2: mas;
  i: Integer;
begin
  if not b[n] then
    begin
      b[n]:=True;
      FillChar(t[n],SizeOf(t[n]),0);
      if n = 0 then
        t[n][0]:=1
      else
        if n = 1 then
          t[n][1]:=1
        else
          begin
            Rec(n-1,m1);
            for i:=n downto 1 do
              m1[i]:=2*m1[i-1];
            m1[0]:=0;
            Rec(n-2,m2);
            for i:=0 to n do
              t[n][i]:=m1[i]-m2[i];
          end;
    end;
  m:=t[n];
end;

begin
  FillChar(b,SizeOf(b),False);
  ReadLn(N);
  while N > 0 do
    begin
      Rec(n,a);
      first:=True;
      for i:=n downto 1 do
        if a[i] <> 0 then
          begin
            if not first then
              if a[i] > 0 then
                Write('+')
              else
                Write('-')
            else
              first:=False;
            if abs(a[i]) <> 1 then
              Write(abs(a[i]));
            if i > 1 then
              Write('Cos^',i,'(A)')
            else
              Write('Cos(A)');
          end;
      if a[0] <> 0 then
        if a[0] >= 0 then
          Write('+',a[0])
        else
          Write(a[0]);
      WriteLn;
      ReadLn(N);
    end;
end.