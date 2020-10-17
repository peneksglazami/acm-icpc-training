{ACM ICPC 2003-2004 South America
 Problem C - Runner Pawns
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemC (input, output);
Type
  Pawn = Record
    P: Integer;
    Live: Boolean;
   end;

Var
  Table: Array [-1..10,-1..10] of Boolean;
  Pawns: Array [1..8] of Pawn;
  i,j,P,H,Best,Er: Integer;
  St: String;

Procedure Solve(N_P,H,Step: Integer);
Const
  D: Array [1..8,1..2] of ShortInt =
     ((-1,-2),(1,-2),(2,-1),(2,1),
      (1,2),(-1,2),(-2,1),(-2,-1));

Var
  i,j,TX,TY: Integer;
  Ok,Lg: Boolean;

Begin
  if Best = P then
    Exit;
  if N_P = 0 then
    Begin
      if Step < Best then
        Best:=Step;
      Exit;
    end;
  Ok:=True;
  for i:=1 to P do
    if Pawns[i].Live then
      if Pawns[i].P+8*Step > 64 then
        Ok:=False;
  if Ok then
    Begin
      if H mod 8 = 0 then
        Begin
          TY:=H div 8;
          TX:=8;
        end
      else
        Begin
          TY:=H div 8 + 1;
          TX:=H mod 8;
        end;
      for i:=1 to 8 do
        Begin
          Ok:=True;
          for j:=1 to P do
            if Pawns[j].P+8*Step = 8*(TY+D[i,2]-2)+TX+D[i,1] then
              Ok:=False;
          if Ok and Table[TY+D[i,2],TX+D[i,1]] then
            Begin
              Lg:=False;
              for j:=1 to P do
                if Pawns[j].Live and (Pawns[j].P+8*Step = 8*(TY+D[i,2]-1)+TX+D[i,1]) then
                  Begin
                    Pawns[j].Live:=False;
                    Solve(N_P-1,8*(TY+D[i,2]-1)+TX+D[i,1],Step+1);
                    Pawns[j].Live:=True;
                    Lg:=True;
                    Break;
                  end;
              if not Lg then
                Solve(N_P,8*(TY+D[i,2]-1)+TX+D[i,1],Step+1);
            end;
        end;
    end;
end;

Begin
  FillChar(Table,SizeOf(Table),0);
  for i:=1 to 8 do
    for j:=1 to 8 do
      Table[i,j]:=True;
  ReadLn(St);
  While St <> '0' do
    Begin
      FillChar(Pawns,SizeOf(Pawns),0);
      Val(Copy(St,1,Pos(' ',St)-1),P,Er);
      Delete(St,1,Pos(' ',St));
      if P <> 0 then
        Begin
          for i:=1 to P do
            Begin
              Val(Copy(St,1,Pos(' ',St)-1),Pawns[i].P,Er);
              Delete(St,1,Pos(' ',St));
              Pawns[i].Live:=True;
            end;
          Val(St,H,Er);
        end
      else
        Val(St,H,Er);
      Best:=10;
      Solve(P,H,0);
      if Best <> 10 then
        WriteLn(Best)
      else
        WriteLn('impossible');
      ReadLn(St);
    end;
end.