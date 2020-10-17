{Problem: 112 - Tree Summing
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem112 (input,output);
{$APPTYPE CONSOLE}
Type
  ss = ^Tree;

  Tree = Record
    x: Integer;
    left,right: ss;
   end;

Var
  St: String;
  N: Integer;
  T: SS;
  Ok: Boolean;

Function ReadData: Boolean;
Var
  S: String;
  Ch: Char;
  br,Er: Integer;
Begin
  ReadData:=False;
  Ch:=' ';
  While (Ch = ' ') do
    Begin
      if EOF then
        Exit;
      While EOLn do
        Begin
          ReadLn;
          if EOF then
            Exit;
        end;
      Read(Ch);
    end;
  S:='';
  S:=S+Ch;
  While Ch <> '(' do
    Begin
      While EOLn do
        ReadLn;
      Read(Ch);
      if Ch <> ' ' then
        S:=S+Ch;
    end;
  Delete(S,Length(S),1);
  Val(S,N,Er);
  S:='(';
  br:=1;
  While br > 0 do
    Begin
      While EOLn do
        ReadLn;
      Read(Ch);
      if Ch = '(' then
        Inc(br)
      else
        if Ch = ')' then
          Dec(br);
      if Ch <> ' ' then
        S:=S+Ch;
    end;
  St:=S;
  ReadData:=True;
end;

Function MakeTree(St: String): ss;
Var
  S,Stt: String;
  i,br,Er: Integer;
  z: ss;
Begin
  Stt:=St;
  Delete(Stt,1,1);
  Delete(Stt,Length(Stt),1);
  if Stt = '' then
    MakeTree:=nil
  else
    Begin
      New(z);
      S:=Copy(Stt,1,Pos('(',Stt)-1);
      Val(S,z^.x,Er);
      Delete(Stt,1,Pos('(',Stt)-1);
      i:=2;
      br:=1;
      While br > 0 do
        Begin
          if Stt[i] = '(' then
            Inc(br)
          else
            if Stt[i] = ')' then
              Dec(br);
          if br > 0 then
            Inc(i);
        end;
      S:=Copy(Stt,1,i);
      z^.left:=MakeTree(S);
      Delete(Stt,1,i);
      z^.right:=MakeTree(Stt);
      MakeTree:=z;
    end;
end;

Procedure Find(t: ss; sum: Integer);
Begin
  if Ok then
    Exit;
  if (t^.left = nil) and (t^.right = nil) then
    Begin
      if t^.x + Sum = N then
        Ok:=True;
      Exit;
    end;
  if t^.left <> nil then
    Find(t^.left,Sum+t^.x);
  if t^.right <> nil then
    Find(t^.right,Sum+t^.x);
end;

Procedure DeleteTree(t: ss);
Begin
  if t^.left <> nil then
    Begin
      DeleteTree(t^.left);
      Dispose(t^.left);
      t^.left:=nil;
    end;
  if t^.right <> nil then
    Begin
      DeleteTree(t^.right);
      Dispose(t^.right);
      t^.right:=nil;
    end;
end;

Begin
  While ReadData do
    Begin
      T:=MakeTree(St);
      Ok:=False;
      if T <> nil then
        Find(T,0);
      if Ok then
        WriteLn('yes')
      else
        WriteLn('no');
      if T <> nil then
        Begin
          DeleteTree(T);
          Dispose(T);
          T:=nil;
        end;
    end;
end.