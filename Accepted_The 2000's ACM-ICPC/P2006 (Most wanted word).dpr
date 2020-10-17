{Problem: 2006 - Most wanted word
 Problem A - ACM ICPC Oceania - South Pacific - 2000/2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem2006;
{$APPTYPE CONSOLE}
Type
  SS = ^Node;

  Node = Record
    St: String[20];
    cnt: Integer;
    left,right: SS;
   end;

Var
  tree: SS;
  max: Integer;
  maxSt: String;

Procedure AddWord(Var T: SS; W: String);
Begin
  if T = nil then
    Begin
      New(T);
      T^.St:=W;
      T^.cnt:=1;
      T^.left:=nil;
      T^.right:=nil;
      if T^.cnt > max then
        Begin
          max:=T^.cnt;
          maxSt:=T^.St;
        end;
    end
  else
    if T^.St = W then
      Begin
        Inc(T^.cnt);
        if T^.cnt > max then
          Begin
            max:=T^.cnt;
            maxSt:=T^.St;
          end;
      end
    else
      if W < T^.St then
        AddWord(T^.left,W)
      else
        AddWord(T^.right,W);
end;

Procedure DeleteTree(Var T: SS);
Begin
  if T = nil then
    Exit;
  DeleteTree(T^.left);
  DeleteTree(T^.right);
  Dispose(T);
  T:=nil;
end;

Procedure DivString(St: String);
Var
  i: Integer;
  W: String;
Begin
  St:=St+' ';
  While St <> '' do
    Begin
      While not (St[1] in ['a'..'z','A'..'Z']) do
        Begin
          Delete(St,1,1);
          if St = '' then
            Exit;
        end;
      W:='';
      i:=1;
      While St[i] in ['a'..'z','A'..'Z'] do
        Begin
          W:=W+St[i];
          Inc(i);
        end;
      Delete(St,1,i);
      for i:=1 to Length(W) do
        if W[i] in ['A'..'Z'] then
          W[i]:=Chr(Ord(W[i])-Ord('A')+Ord('a'));
      AddWord(Tree,W);
    end;
end;

Procedure ReadParagraph;
Var
  St: String;
Begin
  max:=0;
  maxSt:='';
  ReadLn(St);
  While St <> '#' do
    Begin
      DivString(St);
      ReadLn(St);
    end;
  DeleteTree(Tree);
end;

Procedure PrintAnswer;
Var
  i: Integer;
  S: String;
Begin
  if max = 0 then
    Exit;
  Str(max,S);
  While Length(S) < 4 do
    S:=' '+S;
  WriteLn(S,' '+maxSt);  
end;

Begin
  While not EOF do
    Begin
      ReadParagraph;
      PrintAnswer;
    end;
end.