{Problem: 2932 - Vase collection
 Problem B - The 2003 ACM ICPC Northwestern Europe Regional Contest
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2932 (input,output);
Type
  SSet = Set of 1..36;

Var
  ss: Array [1..36] of SSet;
  a,b: Array [1..36] of Integer;
  r: Array [0..10] of Integer;
  i,j,s,d,k,m,n,Res: Integer;
  Ok: Boolean;

Function Amount(a: SSet): Integer;
Var
  i,x: Integer;
Begin
  x:=0;
  for i:=1 to 36 do
    if i in a then
      Inc(x);
  Amount:=x;
end;

Procedure Rec(i,n: Integer; s: SSet);
Var
  j: Integer;
Begin
  if i = k+1 then
    Ok:=True
  else
    for j:=n to m-k+i do
      if Amount(ss[b[j]]*s) >= k then
        Begin
          Rec(i+1,j+1,ss[b[j]]*s);
          if Ok then
            Exit;
        end;
end;

Begin
  ReadLn(n);
  While n > 0 do
    Begin
      FillChar(a,SizeOf(a),0);
      ReadLn(m);
      for i:=1 to 36 do
        ss[i]:=[];
      for i:=1 to m do
        Begin
          ReadLn(s,d);
          ss[s]:=ss[s]+[d];
          Inc(a[s]);
        end;
      FillChar(r,SizeOf(r),0);
      for i:=1 to 10 do
        for j:=1 to 36 do
          if a[j] >= i then
            Inc(r[i]);
      m:=0;
      for i:=1 to 36 do
        if a[i] > 0 then
          Begin
            Inc(m);
            b[m]:=i;
          end;
      j:=10;
      While (r[j] < j) and (j > 0) do
        Dec(j);
      Ok:=False;
      Res:=0;
      for k:=j downto 1 do
        Begin
          Rec(1,1,[1..36]);
          if Ok then
            Begin
              Res:=k;
              Break;
            end;
        end;
      WriteLn(Res);
      Dec(n);
    end;
end.