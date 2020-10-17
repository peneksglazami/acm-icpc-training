{Problem: 624 - CD
 Author: Miguel A. Revilla
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem624 (input, output);
Var
  T: Array [1..20] of Integer;
  Table,Best: Array [1..20] of Boolean;
  i,N,Tr,Sum,BestSum: Integer;

Procedure Solve(i: Integer);
Begin
  if BestSum = N then
    Exit;
  if Sum > N then
    Exit;
  if i = Tr+1 then
    Begin
      if Sum > BestSum then
        Begin
          Best:=Table;
          BestSum:=Sum;
        end;
      Exit;
    end;
  Table[i]:=True;
  Inc(Sum,T[i]);
  Solve(i+1);
  Dec(Sum,T[i]);
  Table[i]:=False;
  Solve(i+1);
end;

Begin
  While not EOF do
    Begin
      Read(N,Tr);
      Sum:=0;
      for i:=1 to Tr do
        Begin
          Read(T[i]);
          Inc(Sum,T[i]);
        end;
      ReadLn;
      if (Sum <= N) then
        Begin
          FillChar(Best,SizeOf(Best),True);
          BestSum:=Sum;
        end
      else
        Begin
          BestSum:=0;
          Sum:=0;
          Solve(1);
        end;
      for i:=1 to Tr do
        if Best[i] then
          Write(T[i],' ');
      WriteLn('sum:',BestSum);
    end;
end.