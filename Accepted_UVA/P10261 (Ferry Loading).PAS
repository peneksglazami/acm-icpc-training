{Problem: 10261 - Ferry Loading
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10261 (input,output);
Var
  a: Array [1..200] of Integer;
  b,c: Array [0..20000] of Boolean;
  num: Array [0..20000] of Byte;
  p: Array [0..200] of Boolean;
  i,j,n,len,x,Test: Integer;
  S: LongInt;
  Ok,find: Boolean;

Procedure Mark(i: Integer);
Begin
  p[num[i]]:=True;
  if i > 0 then
    Mark(i-a[num[i]]);
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn;
      ReadLn(len);
      len:=len*100;
      Ok:=True;
      n:=0;
      S:=0;
      Repeat
        ReadLn(x);
        if (x > 0) and Ok then
          if (x > len) then
            Ok:=False
          else
            if x+S > 2*len then
              Ok:=False
            else
              Begin
                Inc(n);
                a[n]:=x;
                Inc(S,x);
              end;
      Until x = 0;
      if N > 0 then
        Begin
          find:=False;
          FillChar(p,SizeOf(p),False);
          Repeat
            FillChar(b,SizeOf(b),False);
            FillChar(num,SizeOf(num),0);
            b[0]:=True;
            for i:=1 to n do
              Begin
                c:=b;
                for j:=0 to len do
                  if c[j] then
                    if not c[j+a[i]] then
                      Begin
                        b[j+a[i]]:=True;
                        num[j+a[i]]:=i;
                      end;
              end;
            for i:=len downto 1 do
              Begin
                if b[i] then
                  if S-i <= len then
                    Begin
                      Mark(i);
                      find:=True;
                      Break;
                    end;
                if S-i > len then
                  Break;
              end;
            if not find then
              Dec(n);
          Until find or (n = 0);
        end;
      WriteLn(n);
      for i:=1 to n do
        if p[i] then
          WriteLn('starboard')
        else
          WriteLn('port');
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.