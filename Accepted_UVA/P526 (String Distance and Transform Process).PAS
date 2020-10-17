{Problem: 526 - String Distance and Transform Process
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem526 (input,output);
Const
  MaxN = 80;

Var
  d: Array [0..MaxN,0..MaxN] of Byte;
  i,j: Integer;
  St1,St2: String;

Function Min(a,b: Byte): Byte;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Procedure Print(i,j: Integer);
Begin
  if i > 0 then
    if d[i,j] = d[i-1,j]+1 then
      Begin
        WriteLn(d[Length(St1),Length(St2)]-d[i,j]+1,' Delete ',i);
        Print(i-1,j);
        Exit;
      end;

  if j > 0 then
    if d[i,j] = d[i,j-1]+1 then
      Begin
        WriteLn(d[Length(St1),Length(St2)]-d[i,j]+1,' Insert ',i+1,',',St2[j]);
        Print(i,j-1);
        Exit;
      end;

  if (i > 0) and (j > 0) then
    if d[i,j] = d[i-1,j-1] then
      Print(i-1,j-1)
    else
      if d[i,j] = d[i-1,j-1]+1 then
        Begin
          WriteLn(d[Length(St1),Length(St2)]-d[i,j]+1,' Replace ',i,',',St2[j]);
          Print(i-1,j-1);
        end;

end;

Begin
  While not EOF do
    Begin
      ReadLn(St1);
      ReadLn(St2);
      for i:=1 to Length(St1) do
        d[i,0]:=i;
      for i:=1 to Length(St2) do
        d[0,i]:=i;
      for i:=1 to Length(St1) do
        for j:=1 to Length(St2) do
          if St1[i] = St2[j] then
            d[i,j]:=Min(d[i-1,j]+1,Min(d[i,j-1]+1,d[i-1,j-1]))
          else
            d[i,j]:=Min(d[i-1,j]+1,Min(d[i,j-1]+1,d[i-1,j-1]+1));
      WriteLn(d[Length(St1),Length(St2)]);
      Print(Length(St1),Length(St2));
      if not EOF then
        WriteLn;
    end;
end.