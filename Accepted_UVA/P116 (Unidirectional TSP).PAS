{Problem: Unidirectional TSP
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem116 (input,output);
Const
  MaxM = 10;
  MaxN = 100;

Var
  a,t: Array [1..MaxM,1..MaxN] of LongInt;
  w: Array [1..MaxN] of Integer;
  i,j,M,N,imin: Integer;

Function higher(i: Integer): Integer;
Begin
  if i = 1 then
    higher:=M
  else
    higher:=i-1;
end;

Function lower(i: Integer): Integer;
Begin
  if i = M then
    lower:=1
  else
    lower:=i+1;
end;

Begin
  While not EOF do
    Begin
      Read(M,N);
      for i:=1 to M do
        for j:=1 to N do
          Read(a[i,j]);
      for i:=1 to M do
        t[i,N]:=a[i,N];
      for j:=N-1 downto 1 do
        for i:=1 to M do
          Begin
            t[i,j]:=t[i,j+1]+a[i,j];
            if t[i,j] > t[lower(i),j+1]+a[i,j] then
              t[i,j]:=t[lower(i),j+1]+a[i,j];
            if t[i,j] > t[higher(i),j+1]+a[i,j] then
              t[i,j]:=t[higher(i),j+1]+a[i,j];
          end;
      imin:=1;
      for i:=2 to M do
        if t[i,1] < t[imin,1] then
          imin:=i;
      w[1]:=imin;
      for i:=2 to N do
        Begin
          if t[w[i-1],i-1] = t[w[i-1],i] + a[w[i-1],i-1] then
            w[i]:=w[i-1]
          else
            w[i]:=M+1;
          if (w[i] > higher(w[i-1])) and (t[w[i-1],i-1] = t[higher(w[i-1]),i] + a[w[i-1],i-1]) then
            w[i]:=higher(w[i-1]);
          if (w[i] > lower(w[i-1])) and (t[w[i-1],i-1] = t[lower(w[i-1]),i] + a[w[i-1],i-1]) then
            w[i]:=lower(w[i-1]);
        end;
      Write(w[1]);
      for i:=2 to N do
        Write(' ',w[i]);
      WriteLn;
      WriteLn(t[imin,1]);
    end;
end.