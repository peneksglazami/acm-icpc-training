{Problem: 164 - String Computer
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem164 (input, output);
Const
  MaxN = 20;

Var
  d: Array [0..MaxN,0..MaxN] of Byte;
  i,j,N,M: Integer;
  St,St1,St2: String;

Function Min(a,b: Byte): Byte;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Function Num(i: Integer): String;
Var
  St: String;
Begin
  Str(i,St);
  if Length(St) = 1 then
    St:='0'+St;
  Num:=St;
end;

Procedure Print(i,j: Integer);
Begin
  if i > 0 then
    if d[i,j] = d[i-1,j]+1 then
      Begin
        Write('D',St1[i],Num(i));
        Print(i-1,j);
        Exit;
      end;
  if j > 0 then
    if d[i,j] = d[i,j-1]+1 then
      Begin
        Write('I',St2[j],Num(i+1));
        Print(i,j-1);
        Exit;
      end;
  if (i > 0) and (j > 0) then
    if d[i,j] = d[i-1,j-1]+1 then
      Begin
        Write('C',St2[j],Num(i));
        Print(i-1,j-1);
      end
    else
      Print(i-1,j-1);
end;

Begin
  ReadLn(St);
  While St <> '#' do
    Begin
      St1:=Copy(St,1,Pos(' ',St)-1);
      Delete(St,1,Pos(' ',St));
      St2:=St;
      N:=Length(St1);
      M:=Length(St2);
      for i:=1 to N do
        d[i,0]:=i;
      for i:=1 to M do
        d[0,i]:=i;
      for i:=1 to N do
        for j:=1 to M do
          if St1[i] = St2[j] then
            d[i,j]:=Min(d[i-1,j]+1,Min(d[i,j-1]+1,d[i-1,j-1]))
          else
            d[i,j]:=Min(d[i-1,j]+1,Min(d[i,j-1]+1,d[i-1,j-1]+1));
      Print(N,M);
      WriteLn('E');
      ReadLn(St);
    end;
end.