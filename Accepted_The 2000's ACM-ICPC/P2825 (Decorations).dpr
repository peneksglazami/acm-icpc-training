{Problem: 2825 - Decorations
 Problem B - ACM ICPC 2003-2004 North America - East Central Region
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem2825 (input,output);
{$APPTYPE CONSOLE}
Type
  SS = ^Node;

  Node = Record
    St: String[9];
    cnt: Cardinal;
    left,right: SS;
   end;

Var
  a: Array [1..100] of Cardinal;
  s: Array [1..600] of String[10];
  i,j,n,nn,l,m,len: Integer;
  St: String;
  t,tt: SS;

Procedure AddWord(W: String; nn: Integer; Var T: SS);
Begin
  if T = nil then
    Begin
      New(T);
      T^.St:=W;
      T^.cnt:=nn;
      T^.left:=nil;
      T^.right:=nil;
    end
  else
    if W = T^.St then
      Inc(T^.cnt,nn)
    else
      if W < T^.St then
        AddWord(W,nn,T^.left)
      else
        AddWord(W,nn,T^.right);
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

Function Possible(W: String; Var nn: Integer; T: SS): Boolean;
Begin
  if T = nil then
    Result:=False
  else
    if T^.St = W then
      Begin
        nn:=T^.cnt;
        Result:=True;
      end
    else
      if W < T^.St then
        Result:=Possible(W,nn,T^.left)
      else
        Result:=Possible(W,nn,T^.right);
end;

Begin
  ReadLn(n,l,m);
  While (n <> 0) or (l <> 0) or (m <> 0) do
    Begin
      ReadLn(St);
      St:=St+' ';
      for i:=1 to m do
        Begin
          s[i]:='';
          j:=1;
          While St[j] <> ' ' do
            Begin
              s[i]:=s[i]+St[j];
              Inc(j);
            end;
          Delete(St,1,j);
        end;
      FillChar(a,SizeOf(a),0);
      len:=Length(s[1]);
      a[len]:=m;
      DeleteTree(tt);
      for i:=1 to m do
        AddWord(Copy(s[i],2,len-1),1,tt);
      for i:=len+1 to l do
        Begin
          DeleteTree(t);
          t:=tt;
          tt:=nil;
          for j:=1 to m do
            Begin
              St:=Copy(s[j],1,len-1);
              if Possible(St,nn,t) then
                Begin
                  a[i]:=a[i]+nn;
                  AddWord(Copy(s[j],2,len-1),nn,tt);
                end;
            end;
        end;
      WriteLn(a[l]);
      ReadLn(n,l,m);
    end;
end.