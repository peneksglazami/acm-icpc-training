{Problem: 10602 - Editor Nottobad
 Problem source: Russian National Team Olympiad 2000
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10602 (input,output);
Type
  TWord = Record
    st: String;
    aa: Integer;
   end;

Var
  a: Array [1..100] of TWord;
  i,L,N,Test: Integer;

Procedure Trim(Var St: String);
Begin
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Function Len(St1,St2: String): Integer;
Var
  i,N: Integer;
Begin
  if Length(St1) > Length(St2) then
    N:=Length(St2)
  else
    N:=Length(St1);
  for i:=1 to N do
    if St1[i] <> St2[i] then
      Begin
        Len:=Length(St2)-i+1;
        Exit;
      end;
  Len:=Length(St2)-N;
end;

Function LL(St: String): Integer;
Var
  i,N: Integer;
Begin
  if Length(a[1].St) > Length(St) then
    N:=Length(St)
  else
    N:=Length(a[1].St);
  for i:=1 to N do
    if a[1].St[i] <> St[i] then
      Begin
        LL:=i-1;
        Exit;
      end;
  LL:=N;
end;

Function Less(a,b: TWord): Boolean;
Begin
  Less:=(a.aa < b.aa) or ((a.aa = b.aa) and (a.st < b.st));
end;

Procedure Sort(l,r: Integer);
Var
  i,j: Integer;
  x,buf: TWord;
Begin
  i:=l;
  j:=r;
  x:=a[(l+r) div 2];
  Repeat
    While Less(x,a[i]) do Inc(i);
    While Less(a[j],x) do Dec(j);
    if i <= j then
      Begin
        buf:=a[i]; a[i]:=a[j]; a[j]:=buf;
        Inc(i); Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn(N);
      ReadLn(a[1].st);
      Trim(a[1].st);
      for i:=2 to N do
        Begin
          ReadLn(a[i].st);
          Trim(a[i].st);
          a[i].aa:=LL(a[i].st);
        end;
      if N > 1 then
        Sort(2,N);
      L:=Length(a[1].st);
      for i:=2 to N do
        Inc(L,Len(a[i-1].st,a[i].st));
      WriteLn(L);
      for i:=1 to N do
        WriteLn(a[i].St);
      Dec(Test);
    end;
end.