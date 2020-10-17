{Problem: 103 - Stacking Boxes
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem103 (input,output);
Var
  A: Array [1..30,0..10] of Integer;
  len,p: Array [1..30] of Integer;
  i,j,g,k,N,buf,imax: Integer;
  Nadoelo: Boolean;

Function Less(i,j: Integer): Boolean;
Var
  g: Integer;
  Ok: Boolean;
Begin
  Ok:=True;
  g:=1;
  While Ok and (g <= N) do
    Begin
      Ok:=a[i][g] < a[j][g];
      Inc(g);
    end;
  Less:=Ok;
end;

Procedure Print(i: Integer);
Begin
  if p[i] = 0 then
    Write(a[i][0])
  else
    Begin
      Print(p[i]);
      Write(' ',a[i][0]);
    end;
end;

Begin
  While not EOF do
    Begin
      ReadLn(k,N);
      for i:=1 to k do
        Begin
          a[i,0]:=i;
          for j:=1 to N do
            Read(a[i,j]);
          ReadLn;
        end;
      for i:=1 to k do
        for j:=1 to N-1 do
          for g:=j+1 to N do
            if a[i][j] > a[i][g] then
              Begin
                buf:=a[i][j];
                a[i][j]:=a[i][g];
                a[i][g]:=buf;
              end;
      for i:=1 to k-1 do
        for j:=i+1 to k do
          if Less(j,i) then
            for g:=0 to N do
              Begin
                buf:=a[i][g];
                a[i][g]:=a[j][g];
                a[j][g]:=buf;
              end;
      FillChar(p,SizeOf(p),0);
      for i:=1 to k do
        len[i]:=1;
      imax:=1;
      for i:=1 to k-1 do
        for j:=i+1 to k do
          if Less(i,j) then
            if len[i]+1 > len[j] then
              Begin
                len[j]:=len[i]+1;
                p[j]:=i;
                if len[imax] < len[j] then
                  imax:=j;
              end;
      WriteLn(len[imax]);
      Print(imax);
      WriteLn;
    end;
end.