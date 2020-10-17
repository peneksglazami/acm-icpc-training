{Problem: 753 - A Plug for UNIX
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem753 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 100;
  MaxM = 100;
  MaxK = 100;

Var
  a: Array [1..MaxN,1..MaxM] of Boolean;
  b: Array [1..MaxN+2*MaxK,1..MaxN+2*MaxK] of Boolean;
  v: Array [1..MaxN] of Boolean;
  p: Array [1..MaxM] of Integer;
  aa: Array [1..MaxN] of String;
  bb,cc: Array [1..MaxM] of String;
  ff: Array [1..MaxN+2*MaxK] of String;
  i,j,N,M,K,max,f,Test: Integer;

Function Trim(St: String): String;
Begin
  While St[1] = ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
  Trim:=St;
end;

Procedure ReadData;
Var
  i,j,g,h,x,y: Integer;
  St,S1,S2: String;
  Ok: Boolean;
Begin
  FillChar(a,SizeOf(a),False);
  FillChar(b,SizeOf(b),False);
  FillChar(p,SizeOf(p),0);
  ReadLn;
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(aa[i]);
      aa[i]:=Trim(aa[i]);
    end;
  ReadLn(M);
  for i:=1 to M do
    Begin
      ReadLn(St);
      St:=Trim(St);
      bb[i]:=Copy(St,1,Pos(' ',St)-1);
      Delete(St,1,Pos(' ',St));
      cc[i]:=Trim(St);
    end;
  f:=N;
  for i:=1 to N do
    ff[i]:=aa[i];
  ReadLn(K);
  for i:=1 to K do
    Begin
      ReadLn(St);
      St:=Trim(St);
      S1:=Copy(St,1,Pos(' ',St)-1);
      Delete(St,1,Pos(' ',St));
      S2:=Trim(St);
      Ok:=False;
      for j:=1 to f do
        if S1 = ff[j] then
          Begin
            x:=j;
            Ok:=True;
            Break;
          end;
      if not Ok then
        Begin
          Inc(f);
          x:=f;
          ff[f]:=S1;
        end;
      Ok:=False;
      for j:=1 to f do
        if S2= ff[j] then
          Begin
            y:=j;
            Ok:=True;
            Break;
          end;
      if not Ok then
        Begin
          Inc(f);
          y:=f;
          ff[f]:=S2;
        end;
      for j:=1 to f do
        if ff[j] = ff[y] then
          b[j,x]:=True;
    end;
  for i:=1 to f do
    b[i,i]:=True;
  for g:=1 to f do
    for i:=1 to f do
      for j:=1 to f do
        b[i,j]:=b[i,j] or (b[i,g] and b[g,j]);
  for i:=1 to N do
    for j:=1 to M do
      for g:=1 to f do
        if ff[g] = aa[i] then
          Begin
            for h:=1 to f do
              if ff[h] = cc[j] then
                Begin
                  a[i,j]:=b[g,h];
                  Break;
                end;
            Break;
          end;
end;

Function TryFind(i: Integer): Boolean;
Var
  j: Integer;
Begin
  TryFind:=False;
  if (i = 0) or v[i] then
    Exit;
  v[i]:=True;  
  for j:=1 to M do
    if a[i,j] and ((p[j] = 0) or TryFind(p[j])) then
      Begin
        TryFind:=True;
        p[j]:=i;
        Exit;
      end;
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadData;
      max:=0;
      for i:=1 to N do
        Begin
          FillChar(v,SizeOf(v),False);
          if TryFind(i) then
            Inc(max);
        end;
      WriteLn(M-max);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.