{Problem: 311 - Packets
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem311 (input, output);
Var
  P: Array [1..6,1..6] of Boolean;
  A: Array [1..6] of Integer;
  i,j,Amount,Parcel,Row,Col: Integer;

Function FindPlace(H: Integer; Var Row,Col: Integer): Boolean;
Var
  i,j,g,k: Integer;
  OK: Boolean;
Label
  Success;
Begin
  OK:=False;
  for i:=1 to 6 do
    for j:=1 to 6 do
      if P[i,j] and (i + H <= 7) and (j + H <= 7) then
        Begin
          OK:=True;
          for g:=i to i+H-1 do
            for k:=j to j+H-1 do
              OK:=OK and P[g,k];
          if OK then
            GOTO Success;
        end;
  Success:
  if OK then
    Begin
      Row:=i;
      Col:=j;
    end;
  FindPlace:=OK;
end;

Procedure FillParcel(H,Row,Col: Integer);
Var
  i,j: Integer;
Begin
  for i:=Row to Row+H-1 do
    for j:=Col to Col+H-1 do
      P[i,j]:=False;
end;

Begin
  Amount:=0;
  for i:=1 to 6 do
    Begin
      Read(A[i]);
      Inc(Amount,A[i]);
    end;
  ReadLn;
  While Amount > 0 do
    Begin
      Parcel:=0;
      While Amount > 0 do
        Begin
          FillChar(P,SizeOf(P),True);
          Inc(Parcel);
          for i:=6 downto 1 do
            While (A[i] > 0) and FindPlace(i,Row,Col) do
              Begin
                Dec(Amount);
                Dec(A[i]);
                FillParcel(i,Row,Col);
              end;
        end;
      WriteLn(Parcel);
      Amount:=0;
      for i:=1 to 6 do
        Begin
          Read(A[i]);
          Inc(Amount,A[i]);
        end;
      ReadLn;
    end;
end.