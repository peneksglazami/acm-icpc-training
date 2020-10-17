{Problem: 275 - Expanding Fractions
 East Central Regionals - 1994 - Problem F
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem275 (input,output);
{$APPTYPE CONSOLE}
Var
  T: Array [0..1000,0..9] of Integer;
  i,N,M,L: Integer;
  St: String;
  Cicle: Boolean;

Procedure WriteSt(St: String);
Var
  i: Integer;
Begin
  for i:=1 to Length(St) do
    Begin
      Write(St[i]);
      if i mod 50 = 0 then
        WriteLn;
    end;
  if Length(St) mod 50 <> 0 then
    WriteLn;  
end;

Begin
  ReadLn(N,M);
  While (N <> 0) or (M <> 0) do
    Begin
      FillChar(T,SizeOf(T),0);
      if N = 0 then
        St:='.0'
      else
        St:='.';
      Cicle:=False;
      i:=0;
      While (N <> 0) and not Cicle do
        Begin
          Inc(i);
          L:=10*N div M;
          N:=10*N-L*M;
          if T[N,L] = 0 then
            Begin
              T[N,L]:=i;
              St:=St+Chr(Ord('0')+L);
            end
          else
            Cicle:=True;
        end;
      WriteSt(St);
      if not Cicle then
        WriteLn('This expansion terminates.')
      else
        WriteLn('The last ',i-T[N,L],' digits repeat forever.');
      WriteLn;
      ReadLn(N,M);
    end;
end.