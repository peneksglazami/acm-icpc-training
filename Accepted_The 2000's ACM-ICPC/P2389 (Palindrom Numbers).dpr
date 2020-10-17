{Problem 2389 - Palindrom Numbers
 ACM ICPC - Latin America - South America - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I+,J-,K-,L-,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
Program Problem2389;
{$APPTYPE CONSOLE}
Var
  a: Array [0..16] of Word;
  p: Array [2..16] of Boolean;
  i,N: Word;
  Ok: Boolean;

Procedure ToBase(N,b: Word);
Begin
  a[0]:=0;
  While N > 0 do
    Begin
      Inc(a[0]);
      a[a[0]]:=N mod b;
      N:=N div b;
    end;
end;

Function IsPalindrom: Boolean;
Var
  i: Integer;
Begin
  Result:=False;
  for i:=1 to a[0] div 2 do
    if a[i] <> a[a[0]-i+1] then
      Exit;
  Result:=True;
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(p,SizeOf(p),False);
      Ok:=False;
      for i:=2 to 16 do
        Begin
          ToBase(N,i);
          p[i]:=IsPalindrom;
          Ok:=p[i] or Ok;
        end;
      if Ok then
        Begin
          Write('Number ',N,' is palindrom in basis');
          for i:=2 to 16 do
            if p[i] then
              Write(' ',i);
          WriteLn;
        end
      else
        WriteLn('Number ',N,' is not a palindrom');
      ReadLn(N);
    end;
end.