{Problem: 2241 - Stockbroker Grapevine
 Africa and Middle East - South Africa - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2241 (input,output);
Var
  a: Array [1..100] of Integer;
  s,m: Array [0..100] of Integer;
  b: Array [1..100] of Boolean;
  d: Array [1..100,1..100] of Integer;
  i,j,g,N,K,imin,min,max: Integer;
  Find,Ok,Nadoelo: Boolean;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(d,SizeOf(D),0);
      min:=MaxInt;
      for i:=1 to N do
        Begin
          Read(K);
          for j:=1 to K do
            Begin
              Read(g);
              Read(d[i,g]);
            end;
          ReadLn;
        end;
      Find:=False;
      for i:=1 to N do
        Begin
          FillChar(a,SizeOf(a),0);
          FillChar(b,SizeOf(b),False);
          s[0]:=1;
          s[s[0]]:=i;
          b[i]:=True;
          Repeat
            Nadoelo:=True;
            m:=s;
            FillChar(s,SizeOf(s),0);
            for j:=1 to m[0] do
              for g:=1 to N do
                if d[m[j],g] > 0 then
                  if not b[g] then
                    Begin
                      b[g]:=True;
                      a[g]:=a[m[j]]+d[m[j],g];
                      Inc(s[0]);
                      s[s[0]]:=g;
                      Nadoelo:=False;
                    end
                  else
                    if a[g] > a[m[j]]+d[m[j],g] then
                      Begin
                        a[g]:=a[m[j]]+d[m[j],g];
                        Inc(s[0]);
                        s[s[0]]:=g;
                        Nadoelo:=False;
                      end;
          Until Nadoelo;
          Ok:=True;
          for j:=1 to N do
            if i <> j then
              Ok:=Ok and (a[j] > 0);
          Find:=Find or Ok;
          if Ok then
            Begin
              max:=0;
              for j:=1 to N do
                if a[j] > max then
                  max:=a[j];
              if max < min then
                Begin
                  imin:=i;
                  min:=max;
                end;
            end;
        end;
      if Find then
        Write(imin,' ',min)
      else
        Write('disjoint');
      ReadLn(N);
      if N <> 0 then
        WriteLn;
    end;
end.