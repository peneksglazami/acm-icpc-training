{Problem: 796 - Critical Links
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem796 (input,output);
Const
  MaxN = 145;

Type
  Bridge = Record
    x,y: Integer;
   end;

Var
  a: Array [0..MaxN,0..MaxN] of Boolean;
  num,low: Array [0..MaxN] of Integer;
  b: Array [1..MaxN*(MaxN-1) div 2] of Bridge;
  i,j,k,nm,Er,br,N,x,y: Integer;
  St: String;
  Ch: Char;

Function min(a,b: Integer): Integer;
Begin
  if a < b then
    min:=a
  else
    min:=b;
end;

Procedure DFS(v,p: Integer);
Var
  i: Integer;
Begin
  Inc(nm);
  num[v]:=nm;
  low[v]:=num[v];
  for i:=0 to N-1 do
    if a[v,i] then
      if num[i] = 0 then
        Begin
          DFS(i,v);
          low[v]:=min(low[v],low[i]);
          if low[i] > num[v] then
            Begin
              Inc(br);
              if v < i then
                Begin
                  b[br].x:=v;
                  b[br].y:=i;
                end
              else
                Begin
                  b[br].x:=i;
                  b[br].y:=v;
                end
            end;
        end
      else
        if (i <> p) and (num[i] < num[v]) then
          low[v]:=min(low[v],num[i]);

end;

Function Less(a,b: Bridge): Boolean;
Begin
  Less:=(a.x < b.x) or ((a.x = b.x) and (a.y < b.y));
end;

Procedure Sort(l,r: Integer);
Var
  i,j: Integer;
  x,buf: Bridge;
Begin
  i:=l;
  j:=r;
  x:=b[(l+r) div 2];
  Repeat
    While Less(b[i],x) do Inc(i);
    While Less(x,b[j]) do Dec(j);
    if i <= j then
      Begin
        buf:=b[i]; b[i]:=b[j]; b[j]:=buf;
        Inc(i); Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Begin
  While not EOF do
    Begin
      FillChar(a,SizeOf(a),False);
      ReadLn(N);
      for i:=1 to N do
        Begin
          Read(x);
          Read(Ch);
          St:=Ch;
          While Ch <> ')' do
            Begin
              Read(Ch);
              St:=St+Ch;
            end;
          Delete(St,1,Pos('(',St));
          Delete(St,Length(St),1);
          Val(St,k,Er);
          for j:=1 to k do
            Begin
              Read(y);
              a[x,y]:=True;
              a[y,x]:=True;
            end;
          ReadLn;
        end;
      if not EOF then
        ReadLn;
      br:=0;
      nm:=0;
      FillChar(num,SizeOf(num),0);
      for i:=0 to N-1 do
        if Num[i] = 0 then
          DFS(i,-1);
      if br > 0 then
        Sort(1,br);
      WriteLn(br,' critical links');
      for i:=1 to br do
        WriteLn(b[i].x,' - ',b[i].y);
      WriteLn;
    end;
end.