{ACM ICPC 2004 - South Pacific Region
 Problem A - Jelly
 Solution - Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA;
Type
  Vol = Record
    Children: Set of 1..100;
    V: LongInt;
   end;

Var
  Name: Array [1..100] of String[10];
  Vols: Array [1..3] of Vol;
  i,j,Amount,A,B,H,N,ChildA,ChildB: Byte;
  Change: Vol;
  Ch: Char;
  Ok: Boolean;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(Vols,SizeOf(Vols),0);
      Amount:=0;
      for i:=1 to N do
        Begin
          Name[i]:='';
          Ch:=#0;
          While Ch <> ' ' do
            Begin
              Read(Ch);
              if Ch <> ' ' then
                Name[i]:=Name[i]+Ch;
            end;
          ReadLn(A,B,H);
          Ok:=False;
          for j:=1 to 3 do
            if A*B*H = Vols[j].V then
              Begin
                Vols[j].Children:=Vols[j].Children+[i];
                Ok:=True;
              end;
          if not Ok then
            Begin
              Inc(Amount);
              Vols[Amount].Children:=Vols[Amount].Children+[i];
              Vols[Amount].V:=A*B*H;
            end;
        end;
      if Amount = 1 then
        WriteLn('No child has lost jelly.')
      else
        Begin
          for i:=1 to Amount-1 do
            for j:=i+1 to Amount do
              if Vols[i].V > Vols[j].V then
                Begin
                  Change:=Vols[i];
                  Vols[i]:=Vols[j];
                  Vols[j]:=Change;
                end;
          for i:=1 to N do
            if i in Vols[1].Children then
              Begin
                ChildA:=i;
                Break;
              end;
          for i:=1 to N do
            if i in Vols[Amount].Children then
              Begin
                ChildB:=i;
                Break;
              end;
          WriteLn(Name[ChildA],' has lost jelly to ',Name[ChildB],'.');
        end;
      ReadLn(N);
    end;
end.