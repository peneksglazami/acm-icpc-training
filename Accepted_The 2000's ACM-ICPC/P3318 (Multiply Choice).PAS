{Problem: 3318 - Multiple Choice
 ACM ICPC - North America - Southeast - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}
Program Problem3318 (input,output);
Type
  SSet = Set of 1..10;

Var
  SS: Array [1..26] of String;
  a: Array [1..26] of SSet;
  b: Array [1..26] of Boolean;
  n: Integer;

Function Empty(St: String): Boolean;
Var
  i: Integer;
Begin
  Empty:=False;
  for i:=1 to Length(St) do
    if St[i] <> ' ' then
      Exit;
  Empty:=True;
end;

Procedure Trim(Var St: String);
Begin
  While (St <> '') and (St[1] = ' ') do
    Delete(St,1,1);
  While (St <> '') and (St[Length(St)] = ' ') do
    Delete(St,Length(St),1);
end;

Function RomanToInt(St: String): Byte;
Begin
  if St = 'I' then
    RomanToInt:=1;
  if St = 'II' then
    RomanToInt:=2;
  if St = 'III' then
    RomanToInt:=3;
  if St = 'IV' then
    RomanToInt:=4;
  if St = 'V' then
    RomanToInt:=5;
  if St = 'VI' then
    RomanToInt:=6;
  if St = 'VII' then
    RomanToInt:=7;
  if St = 'VIII' then
    RomanToInt:=8;
  if St = 'IX' then
    RomanToInt:=9;
  if St = 'X' then
    RomanToInt:=10;
end;

Procedure StrToSet(St: String; Var S: SSet);
Var
  i: Integer;
Begin
  Delete(St,1,3);
  for i:=1 to Length(St) do
    if not (St[i] in ['I','V','X']) then
      St[i]:=' ';
  Trim(St);
  S:=[];
  Repeat
    St:=St+' ';
    S:=S+[RomanToInt(Copy(St,1,Pos(' ',St)-1))];
    Delete(St,1,Pos(' ',St));
    Trim(St);
  Until St = '';
end;

Procedure ReadTest;
Var
  St: String;
Begin
  ReadLn(St);
  WriteLn(St);
  While not Empty(St) do
    Begin
      ReadLn(St);
      WriteLn(St);
    end;
  ReadLn(St);
  WriteLn(St);
  While not Empty(St) do
    Begin
      ReadLn(St);
      WriteLn(St);
    end;
  n:=1;
  ReadLn(St);
  SS[n]:=St;
  Trim(SS[n]);
  StrToSet(St,a[n]);
  While not EOF and not Empty(St) do
    Begin
      ReadLn(St);
      if not Empty(St) then
        Begin
          Inc(n);
          SS[n]:=St;
          Trim(SS[n]);
          StrToSet(St,a[n]);
        end;
    end;
end;

Procedure Solve;
Var
  i,j: Integer;
Begin
  FillChar(b,SizeOf(b),False);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i]*a[j] = a[j] then
        b[j]:=True
      else
        if a[i]*a[j] = a[i] then
          b[i]:=True;
end;

Procedure PrintAnswer;
Var
  i: Integer;
Begin
  for i:=1 to n do
    if b[i] then
      WriteLn(SS[i],' only')
    else
      WriteLn(SS[i]);
end;

Begin
  While not EOF do
    Begin
      ReadTest;
      Solve;
      PrintAnswer;
      WriteLn;
    end;
end.