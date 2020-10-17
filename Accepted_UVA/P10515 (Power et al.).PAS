Program Problem10515 (input, output);
Var
  St,N1,N2: String;
  Res,X,Er: Integer;

Procedure GiveSt(St: String; Var N1,N2: String);
Var
  i: Integer;
Begin
  N1:=Copy(St,1,Pos(' ',St)-1);
  i:=Pos(' ',St);
  While St[i] = ' ' do
    Inc(i);
  N2:='';
  While ((St[i] >= '0') and (St[i] <= '9')) and (i <= Length(St)) do
    Begin
      N2:=N2+St[i];
      Inc(i);
    end;
end;

Function AllZero(N1,N2: String): Boolean;
Begin
  AllZero:=((N1[1] = '0') and (Length(N1) = 1)) and ((N2[1] = '0') and (Length(N2) = 1));
end;

Begin
  ReadLn(St);
  GiveSt(St,N1,N2);
  While not AllZero(N1,N2) do
    Begin
      if (Length(N2) = 1) and (N2[1] = '0') then
        Res:=1
      else
        Case N1[Length(N1)] of
          '0': Res:=0;
          '1': Res:=1;
          '2': Begin
                 if Length(N2) >= 2 then
                   Val(N2[Length(N2)-1]+N2[Length(N2)],X,Er)
                 else
                   Val(N2[Length(N2)],X,Er);
                 Case (X mod 4) of
                   0: Res:=6;
                   1: Res:=2;
                   2: Res:=4;
                   3: Res:=8;
                  end;
               end;
          '3': Begin
                 if Length(N2) >= 2 then
                   Val(N2[Length(N2)-1]+N2[Length(N2)],X,Er)
                 else
                   Val(N2[Length(N2)],X,Er);
                 Case (X mod 4) of
                   0: Res:=1;
                   1: Res:=3;
                   2: Res:=9;
                   3: Res:=7;
                  end;
               end;
          '4': Begin
                 Val(N2[Length(N2)],X,Er);
                 Case (X mod 2) of
                   0: Res:=6;
                   1: Res:=4;
                  end;
               end;
          '5': Res:=5;
          '6': Res:=6;
          '7': Begin
                 if Length(N2) >= 2 then
                   Val(N2[Length(N2)-1]+N2[Length(N2)],X,Er)
                 else
                   Val(N2[Length(N2)],X,Er);
                 Case (X mod 4) of
                   0: Res:=1;
                   1: Res:=7;
                   2: Res:=9;
                   3: Res:=3;
                  end;
               end;
          '8': Begin
                 if Length(N2) >= 2 then
                   Val(N2[Length(N2)-1]+N2[Length(N2)],X,Er)
                 else
                   Val(N2[Length(N2)],X,Er);
                 Case (X mod 4) of
                   0: Res:=6;
                   1: Res:=8;
                   2: Res:=4;
                   3: Res:=2;
                  end;
               end;
          '9': Begin
                 Val(N2[Length(N2)],X,Er);
                 Case (X mod 2) of
                   0: Res:=1;
                   1: Res:=9;
                  end;
               end;
         end;
      WriteLn(Res);
      ReadLn(St);
      GiveSt(St,N1,N2);
    end;
end.