{Problem: 1279
 ACM ICPC NEERC 2003-2004 Quarterfinal - Central Subregion
 Problem F - Warehouse
 Solution: Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program P1279;
{$APPTYPE CONSOLE}
Var
  Table: Array [1..1001] of LongInt;
  i,j,h,N,M,K,Max,Min: LongInt;

Begin
  FillChar(Table,SizeOf(Table),0);
  Max:=0;
  ReadLn(N,M,K);
  for i:=1 to N do
    Begin
      for j:=1 to M do
        Begin
          Read(h);
          Inc(Table[h]);
          if h > Max then
            Max:=h;
        end;
      ReadLn;
    end;
  i:=1;
  While (K > 0) and (i < Max) do
    Begin
      if K >= Table[i] then
        Begin
          Inc(Table[i+1],Table[i]);
          Dec(K,Table[i]);
          Table[i]:=0;
        end
      else
        Begin
          K:=0;
          Dec(Table[i],K);
        end;
      Inc(i);
    end;
  Min:=0;
  if K = 0 then
    Begin
      for i:=1 to Max do
        if Table[i] <> 0 then
          Begin
            Min:=i;
            Break;
          end;
    end
  else
    Min:=Max+(K div (N*M));
  WriteLn(Min);
end.