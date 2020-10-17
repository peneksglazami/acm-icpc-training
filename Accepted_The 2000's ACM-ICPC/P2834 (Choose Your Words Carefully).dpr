{Problem: 2834 - Choose Your Words Carefully
 ACM ICPC - North America - Mid Atlantic - 2003/2004
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2834;
{$APPTYPE CONSOLE}
type
  PNode = ^Node;

  Node = record
    w: String;
    cnt: Integer;
    left,right: PNode;
  end;

var
  St: String;
  i,max,Test: Integer;
  Tree: PNode;

procedure Trim(var St: String);
begin
  while (Length(St) > 0) and (St[1] = ' ') do
    Delete(St,1,1);
  while (Length(St) > 0) and (St[Length(St)] = ' ') do
    Delete(St,Length(St),1);
end;

function NextToken(var St: String): String;
begin
  Result:=Copy(St,1,Pos(' ',St)-1);
  Delete(St,1,Pos(' ',St));
  Trim(St);
end;

procedure AddWord(var T: PNode; w: String);
begin
  if T = nil then
    begin
      New(T);
      T^.w:=w;
      T^.cnt:=1;
      T^.left:=nil;
      T^.right:=nil;
      if max < T^.cnt then
        max:=1;
    end
  else
    if T^.w = w then
      begin
        Inc(T^.cnt);
        if max < T^.cnt then
          max:=T^.cnt;
      end
    else
      if T^.w > w then
        AddWord(T^.left,w)
      else
        AddWord(T^.right,w);  
end;

procedure PrintAnswer(T: PNode);
begin
  if T = nil then
    Exit;
  PrintAnswer(T^.left);
  if T^.cnt = max then
    WriteLn(T^.w);
  PrintAnswer(T^.right);
  Dispose(T);  
end;

begin
  ReadLn(Test);
  ReadLn;
  while Test > 0 do
    begin
      Tree:=nil;
      max:=0;
      ReadLn(St);
      Trim(St);
      while St <> '' do
        begin
          for i:=1 to Length(St) do
            if not (St[i] in ['a'..'z']) then
              if (St[i] in ['A'..'Z']) then
                St[i]:=Chr(Ord('a')+(Ord(St[i])-Ord('A')))
              else
                St[i]:=' ';
          while St <> '' do
            begin
              St:=St+' ';
              AddWord(Tree,NextToken(St));
            end;
          if not EOF then
            begin
              ReadLn(St);
              Trim(St);
            end;
        end;
      WriteLn(max,' occurrences');
      PrintAnswer(Tree);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.