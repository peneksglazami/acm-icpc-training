Program Problem10018 (input, output);
{$APPTYPE CONSOLE}
Var
  P,P2,dP: Int64;
  i,N,Kol: Integer;

Begin
  ReadLn(N);
  for i:=1 to N do
    Begin
      ReadLn(P);
      dP:=P;
      P2:=0;
      While (dP <> 0) do
        Begin
          P2:=P2*10+(dP mod 10);
          dP:=dP div 10;
        end;
      Kol:=0;
      While (P <> P2) do
        Begin
          P:=P+P2;
          dP:=P;
          P2:=0;
          While (dP <> 0) do
            Begin
              P2:=P2*10+(dP mod 10);
              dP:=dP div 10;
            end;
          Inc(Kol);
        end;
      WriteLn(Kol,' ',P);
    end;
end.
