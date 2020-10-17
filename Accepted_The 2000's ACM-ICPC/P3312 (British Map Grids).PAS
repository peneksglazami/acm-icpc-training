{Problem: 3312 - British Map Grids
 ACM ICPC - North America - Southeast - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}
Program Problem3312 (input,output);
Const
  Grid: Array [0..2,0..2] of String[2] = (('ST','SU','TQ'),
                                          ('SO','SP','TL'),
                                          ('SJ','SK','TF'));

Var
  S1,S2: String;

Procedure Trim(Var St: String);
Begin
  While St[1] =  ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Function Invalid(St: String): Boolean;
Var
  S: String;
  i,j: Integer;
Begin
  S:=Copy(St,1,2);
  Invalid:=False;
  for i:=0 to 2 do
    for j:=0 to 2 do
      if S = Grid[i,j] then
        Exit;
  Invalid:=True;
end;

Function Dist(S1,S2: String): Double;
Var
  X1,X2,Y1,Y2: Double;
  i,j,Int,Er: Integer;
  S: String;
Begin
  S:=Copy(S1,1,2);
  Delete(S1,1,2);
  for i:=0 to 2 do
    for j:=0 to 2 do
      if S = Grid[i,j] then
        Begin
          X1:=100*j;
          Y1:=100*i;
        end;
  S:=Copy(S2,1,2);
  Delete(S2,1,2);
  for i:=0 to 2 do
    for j:=0 to 2 do
      if S = Grid[i,j] then
        Begin
          X2:=100*j;
          Y2:=100*i;
        end;
  if Length(S1) = 4 then
    Begin
      Val(Copy(S1,1,2),Int,Er);
      X1:=X1+Int;
      Val(Copy(S1,3,2),Int,Er);
      Y1:=Y1+Int;
      Val(Copy(S2,1,2),Int,Er);
      X2:=X2+Int;
      Val(Copy(S2,3,2),Int,Er);
      Y2:=Y2+Int;
    end
  else
    Begin
      Val(Copy(S1,1,3),Int,Er);
      X1:=X1+Int/10;
      Val(Copy(S1,4,3),Int,Er);
      Y1:=Y1+Int/10;
      Val(Copy(S2,1,3),Int,Er);
      X2:=X2+Int/10;
      Val(Copy(S2,4,3),Int,Er);
      Y2:=Y2+Int/10;
    end;
  Dist:=Sqrt(Sqr(X2-X1)+Sqr(Y2-Y1));
end;

Begin
  While not EOF do
    Begin
      ReadLn(S2);
      Trim(S2);
      S1:=Copy(S2,1,Pos(' ',S2)-1);
      Delete(S2,1,Pos(' ',S2));
      Trim(S2);
      Write(S1,' to ',S2,': ');
      if (Length(S1) <> Length(S2)) or Invalid(S1) or Invalid(S2) then
        WriteLn('Invalid Grid Reference')
      else
        WriteLn(Dist(S1,S2):0:2,' km');
    end;
end.