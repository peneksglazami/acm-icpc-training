{Problem: 10946 - You want what filled?
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program P10946 (input,output);
{$APPTYPE CONSOLE}
Var
  a: Array [0..51,0..51] of Char;
  t: Array [1..2500,0..10000] of Char;
  tt: Array [1..2500] of Integer;
  i,j,k,x,y,n_case,max,cnt: Integer;
  Ch,buf: Char;

Procedure Fill(i,j: Integer);
Var
  Ch: Char;
Begin
  Ch:=a[i,j];
  a[i,j]:='.';
  Inc(cnt);
  if a[i-1,j] = Ch then Fill(i-1,j);
  if a[i+1,j] = Ch then Fill(i+1,j);
  if a[i,j-1] = Ch then Fill(i,j-1);
  if a[i,j+1] = Ch then Fill(i,j+1);
end;

Begin
  ReadLn(x,y);
  While (x <> 0) or (y <> 0) do
    Begin
      FillChar(a,SizeOf(a),'.');
      FillChar(tt,SizeOf(tt),0);
      for i:=1 to x do
        Begin
          for j:=1 to y do
            Read(a[i,j]);
          ReadLn;
        end;
      max:=0;
      for i:=1 to x do
        for j:=1 to y do
          if a[i,j] <> '.' then
            Begin
              Ch:=a[i,j];
              cnt:=0;
              Fill(i,j);
              Inc(tt[cnt]);
              t[cnt,tt[cnt]]:=Ch;
              if max < cnt then
                max:=cnt;
            end;
      for i:=1 to max do
        for j:=1 to tt[i]-1 do
          for k:=j+1 to tt[i] do
            if t[i,j] > t[i,k] then
              Begin
                buf:=t[i,j];
                t[i,j]:=t[i,k];
                t[i,k]:=buf;
              end;
      Inc(n_case);
      WriteLn('Problem ',n_case,':');
      for i:=max downto 1 do
        for j:=1 to tt[i] do
          WriteLn(t[i,j],' ',i);
      ReadLn(x,y);
    end;
end.