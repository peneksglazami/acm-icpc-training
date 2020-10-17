{Problem: 10356 - Rough Roads
 Problem D - September 2002 Monthly Contest
 Author: Mustaq Ahmed
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10356 (input,output);
Const
  MaxN = 501;

Var
  a: Array [0..MaxN-1,0..MaxN-1] of Byte;
  b,bb: Array [0..MaxN-1] of Boolean;
  s,m: Array [0..MaxN-1] of Integer;
  f,ff: Array [0..MaxN-1] of Integer;
  i,j,N,r,x,y,n_case: Integer;

Begin
  While not EOF do
    Begin
      ReadLn(N,r);
      FillChar(a,SizeOf(a),0);
      for i:=1 to r do
        Begin
          Read(x,y);
          ReadLn(a[x,y]);
          a[y,x]:=a[x,y];
        end;
      FillChar(b,SizeOf(b),False);
      FillChar(bb,SizeOf(bb),False);
      s[0]:=1;
      s[1]:=0;
      b[0]:=True;
      Repeat
        m:=s; s[0]:=0;
        for i:=1 to m[0] do
          for j:=0 to N-1 do
            if a[m[i],j] > 0 then
              Begin
                if b[m[i]] then
                  if not bb[j] then
                    Begin
                      ff[j]:=f[m[i]]+a[m[i],j];
                      bb[j]:=True;
                      Inc(s[0]);
                      s[s[0]]:=j;
                    end
                  else
                    if ff[j] > f[m[i]]+a[m[i],j] then
                      Begin
                        ff[j]:=f[m[i]]+a[m[i],j];
                        Inc(s[0]);
                        s[s[0]]:=j;
                      end;
                if bb[m[i]] then
                  if not b[j] then
                    Begin
                      f[j]:=ff[m[i]]+a[m[i],j];
                      b[j]:=True;
                      Inc(s[0]);
                      s[s[0]]:=j;
                    end
                  else
                    if f[j] > ff[m[i]]+a[m[i],j] then
                      Begin
                        f[j]:=ff[m[i]]+a[m[i],j];
                        Inc(s[0]);
                        s[s[0]]:=j;
                      end;
              end;
      Until s[0] = 0;
      Inc(n_case);
      WriteLn('Set #',n_case);
      if b[N-1] then
        WriteLn(f[N-1])
      else
        WriteLn('?');
    end;
end.