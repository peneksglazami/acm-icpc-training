{Problem: 3280 - Abbreviations
 ACM ICPC - Oceania - South Pacific - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00100000}
{$MAXSTACKSIZE $00100000}
Program Problem3280 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 100;
  MaxL = 100;

Type
  PNode = ^Node;

  Node = Record
     cnt: Integer;
     next: Array ['a'..'z'] of PNode;
   end;

Var
  a: Array [1..MaxN] of String[MaxL];
  i,N,n_case: Integer;
  Tree: PNode;
  ch: Char;

Procedure Add(Var T: PNode; St: String);
Var
  ch: Char;
Begin
  if T^.next[St[1]] = nil then
    Begin
      New(T^.next[St[1]]);
      T^.next[St[1]]^.cnt:=1;
      for ch:='a' to 'z' do
        T^.next[St[1]]^.next[ch]:=nil;
    end
  else
    Inc(T^.next[St[1]]^.cnt);
  if Length(St) > 1 then
    Add(T^.next[St[1]],Copy(St,2,Length(St)-1));
end;

Procedure DeleteTree(Var T: PNode);
Var
  ch: Char;
Begin
  for ch:='a' to 'z' do
    if T^.next[ch] <> nil then
      DeleteTree(T^.next[ch]);
  Dispose(T);
end;

Procedure PrintAbb(T: PNode; St: String);
Begin
  Write(St[1]);
  if T^.next[St[1]]^.cnt > 1 then
    if Length(St) = 1 then
      WriteLn
    else
      PrintAbb(T^.next[St[1]],Copy(St,2,Length(St)-1))
  else
    WriteLn;
end;

Begin
  n_case:=0;
  ReadLn(N);
  While N <> 0 do
    Begin
      New(Tree);
      for ch:='a' to 'z' do
        Tree^.next[ch]:=nil;
      for i:=1 to N do
        Begin
          ReadLn(a[i]);
          Add(Tree,a[i]);
        end;
      Inc(n_case);
      WriteLn(n_case);
      for i:=1 to N do
        Begin
          Write(a[i],' ');
          PrintAbb(Tree,a[i]);
        end;
      ReadLn(N);
      DeleteTree(Tree);
    end;
end.