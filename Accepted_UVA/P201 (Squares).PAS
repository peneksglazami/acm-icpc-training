{Problem: 201 - Squares
 ACM ICPC World Finals - 1989 - Problem B
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem201 (input, output);
Var
  a,b: Array [1..9,1..9] of Boolean;
  s: Array [1..9] of Integer;
  i,j,l,x,y,n_case,N,M: Integer;
  Ch: Char;
  Ok: Boolean;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Function Square(r,c,l: Integer): Boolean;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  Ok:=True;
  for i:=r to r+l-1 do
    Ok:=Ok and a[i,c] and a[i,c+l];
  for i:=c to c+l-1 do
    Ok:=Ok and b[r,i] and b[r+l,i];
  Square:=Ok;
end;

Begin
  While not EOF do
    Begin
      FillChar(a,SizeOf(a),False);
      FillChar(b,SizeOf(b),False);
      FillChar(s,SizeOf(s),0);
      ReadLn(N);
      ReadLn(M);
      for i:=1 to M do
        Begin
          ReadLn(Ch,x,y);
          if Ch = 'V' then
            a[y,x]:=True
          else
            b[x,y]:=True;
        end;
      for i:=1 to N-1 do
        for j:=1 to N-1 do
          for l:=1 to Min(N-i,N-j) do
            if Square(i,j,l) then
              Inc(s[l]);
      Inc(n_case);
      WriteLn('Problem #',n_case);
      WriteLn;
      Ok:=False;
      for i:=1 to 9 do
        if s[i] > 0 then
          Begin
            Ok:=True;
            WriteLn(s[i],' square (s) of size ',i);
          end;
      if not Ok then
        WriteLn('No completed squares can be found.');
      if not EOF then
        Begin
          WriteLn;
          WriteLn('**********************************');
          WriteLn;
        end;
    end;
end.