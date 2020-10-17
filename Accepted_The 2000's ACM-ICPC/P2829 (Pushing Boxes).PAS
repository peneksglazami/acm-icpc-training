{Problem: 2829 - Pushing Boxes
 Problem F - ACM ICPC 2003-2004 North America - East Central Region
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2829 (input,output);
Const
  MaxD = 20;
  MaxN = 10;

Type
  Box = Record
    r,c: Integer;
   end;

  Mas = Array [1..MaxN] of Box;
  MasA = Array [-1..MaxD+1,-1..MaxD+1] of Byte;

Var
  a: MasA;
  b: Mas;
  i,j,h,w,l,N,Er,n_case: Integer;
  St: String;

Function Box_Up(bb: Integer): Boolean;
Begin
  if b[bb].r-1 < 0 then
    Begin
      Box_Up:=False;
      Exit;
    end;
  if a[b[bb].r-1,b[bb].c] <> 0 then
    if not Box_Up(a[b[bb].r-1,b[bb].c]) then
      Begin
        Box_Up:=False;
        Exit;
      end;
  a[b[bb].r-1,b[bb].c]:=bb;
  a[b[bb].r,b[bb].c]:=0;
  Dec(b[bb].r);
  Box_Up:=True;
end;

Procedure Up(l: Integer);
Var
  i,j,hh: Integer;
  bb: Mas;
  aa: MasA;
Begin
  hh:=h;
  for i:=1 to l do
    Begin
      bb:=b;
      aa:=a;
      for j:=0 to w do
        if a[hh,j] <> 0 then
          if not Box_Up(a[hh,j]) then
            Begin
              b:=bb;
              a:=aa;
              Exit;
            end;
      Dec(hh);
    end;
end;

Function Box_Down(bb: Integer): Boolean;
Begin
  if b[bb].r+1 > h then
    Begin
      Box_Down:=False;
      Exit;
    end;
  if a[b[bb].r+1,b[bb].c] <> 0 then
    if not Box_Down(a[b[bb].r+1,b[bb].c]) then
      Begin
        Box_Down:=False;
        Exit;
      end;
  a[b[bb].r+1,b[bb].c]:=bb;
  a[b[bb].r,b[bb].c]:=0;
  Inc(b[bb].r);
  Box_Down:=True;
end;

Procedure Down(l: Integer);
Var
  i,j,sh: Integer;
  bb: Mas;
  aa: MasA;
Begin
  sh:=0;
  for i:=1 to l do
    Begin
      bb:=b;
      aa:=a;
      for j:=0 to w do
        if a[sh,j] <> 0 then
          if not Box_Down(a[sh,j]) then
            Begin
              b:=bb;
              a:=aa;
              Exit;
            end;
      Inc(sh);
    end;
end;

Function Box_Left(bb: Integer): Boolean;
Begin
  if b[bb].c-1 < 0 then
    Begin
      Box_Left:=False;
      Exit;
    end;
  if a[b[bb].r,b[bb].c-1] <> 0 then
    if not Box_Left(a[b[bb].r,b[bb].c-1]) then
      Begin
        Box_Left:=False;
        Exit;
      end;
  a[b[bb].r,b[bb].c-1]:=bb;
  a[b[bb].r,b[bb].c]:=0;
  Dec(b[bb].c);
  Box_Left:=True;
end;

Procedure Left(l: Integer);
Var
  i,j,ww: Integer;
  bb: Mas;
  aa: MasA;
Begin
  ww:=w;
  for i:=1 to l do
    Begin
      bb:=b;
      aa:=a;
      for j:=0 to h do
        if a[j,ww] <> 0 then
          if not Box_Left(a[j,ww]) then
            Begin
              b:=bb;
              a:=aa;
              Exit;
            end;
      Dec(ww);
    end;
end;

Function Box_Right(bb: Integer): Boolean;
Begin
  if b[bb].c+1 > w then
    Begin
      Box_Right:=False;
      Exit;
    end;
  if a[b[bb].r,b[bb].c+1] <> 0 then
    if not Box_Right(a[b[bb].r,b[bb].c+1]) then
      Begin
        Box_Right:=False;
        Exit;
      end;
  a[b[bb].r,b[bb].c+1]:=bb;
  a[b[bb].r,b[bb].c]:=0;
  Inc(b[bb].c);
  Box_Right:=True;
end;

Procedure Right(l: Integer);
Var
  i,j,sw: Integer;
  bb: Mas;
  aa: MasA;
Begin
  sw:=0;
  for i:=1 to l do
    Begin
      bb:=b;
      aa:=a;
      for j:=0 to h do
        if a[j,sw] <> 0 then
          if not Box_Right(a[j,sw]) then
            Begin
              b:=bb;
              a:=aa;
              Exit;
            end;
      Inc(sw);
    end;
end;

Begin
  n_case:=0;
  ReadLn(h,w);
  While (h <> 0) or (w <> 0) do
    Begin
      Dec(h);
      Dec(w);
      FillChar(a,SizeOf(a),0);
      Read(N);
      for i:=1 to N do
        Begin
          Read(b[i].r,b[i].c);
          a[b[i].r,b[i].c]:=i;
        end;
      ReadLn;
      ReadLn(St);
      While St <> 'done' do
        Begin
          Case St[1] of
            'u': Begin
                   Delete(St,1,Pos(' ',St));
                   Val(St,l,Er);
                   Up(l);
                 end;
            'r': Begin
                   Delete(St,1,Pos(' ',St));
                   Val(St,l,Er);
                   Right(l);
                 end;
            'd': Begin
                   Delete(St,1,Pos(' ',St));
                   Val(St,l,Er);
                   Down(l);
                 end;
            'l': Begin
                   Delete(St,1,Pos(' ',St));
                   Val(St,l,Er);
                   Left(l);
                 end;
           end;
          ReadLn(St);
        end;
      Inc(n_case);
      Write('Data set ',n_case,' ends with boxes at locations');
      for i:=0 to h do
        for j:=0 to w do
          if a[i,j] <> 0 then
            Write(' (',i,',',j,')');
      WriteLn('.');
      ReadLn(h,w);
    end;
end.