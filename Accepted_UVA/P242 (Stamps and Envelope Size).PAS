{Problem: 242 - Stamps and Envelope Size
 ACM ICPC World Finals - 1995 - Problem E
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem242 (input,output);
Var
  a,best: Array [0..10] of Integer;
  t,ss,mm: Array [0..1001] of Integer;
  i,j,g,S,N,max: Integer;

Begin
  ReadLn(S);
  While S <> 0 do
    Begin
      ReadLn(N);
      max:=0;
      for i:=1 to N do
        Begin
          Read(a[0]);
          for j:=1 to a[0] do
            Read(a[j]);
          ReadLn;
          FillChar(t,SizeOf(t),0);
          ss[0]:=1;
          ss[1]:=0;
          Repeat
            mm:=ss;
            FillChar(ss,SizeOf(ss),0);
            for j:=1 to mm[0] do
              if t[mm[j]] < S then
                for g:=1 to a[0] do
                  if (t[mm[j]+a[g]] = 0) or (t[mm[j]+a[g]] > t[mm[j]]+1) then
                    Begin
                      t[mm[j]+a[g]]:=t[mm[j]]+1;
                      Inc(ss[0]);
                      ss[ss[0]]:=mm[j]+a[g];
                    end;
          Until ss[0] = 0;
          j:=1;
          While t[j] > 0 do
            Inc(j);
          if max < j-1 then
            Begin
              best:=a;
              max:=j-1;
            end
          else
            if max = j-1 then
              if a[0] < best[0] then
                best:=a
              else
                if (a[0] = best[0]) and (a[a[0]] < best[best[0]]) then
                  best:=a;
        end;
      Write('max coverage = ');
      if max < 10 then
        Write('  ')
      else
        if max < 100 then
          Write(' ');
      Write(max,' : ');
      for i:=1 to best[0] do
        Write(' ',best[i]);
      ReadLn(S);
      if S <> 0 then
        WriteLn;
    end;
end.