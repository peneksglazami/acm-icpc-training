{Problem: 10048 - Audiophobia
 Author: Miguel Revilla
 Solution: Andrey Grigorov}
{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10048 (input, output);
Var
  D: Array [1..100,1..100] of Integer;
  i,j,m,n_case,C,S,Q,c1,c2,sound: Integer;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Function Max(a,b: Integer): Integer;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Begin
  ReadLn(C,S,Q);
  n_case:=1;
  While (C <> 0) or (S <> 0) or (Q <> 0) do
    Begin
      for i:=1 to C do
        for j:=1 to C do
          D[i,j]:=MaxInt;
      for i:=1 to S do
        Begin
          ReadLn(c1,c2,sound);
          D[c1,c2]:=sound;
          D[c2,c1]:=sound;
        end;
      for i:=1 to C do
        D[i,i]:=0;
      for m:=1 to C do
        for i:=1 to C do
          for j:=1 to C do
            D[i,j]:=Min(D[i,j],Max(D[i,m],D[m,j]));
      WriteLn('Case #',n_case);
      for i:=1 to Q do
        Begin
          ReadLn(c1,c2);
          if D[c1,c2] <> MaxInt then
            WriteLn(D[c1,c2])
          else
            WriteLn('no path');
        end;
      Inc(n_case);
      ReadLn(C,S,Q);
      if (C <> 0) or (S <> 0) or (Q <> 0) then
        WriteLn;
    end;
end.