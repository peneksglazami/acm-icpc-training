{Problem: 10703 - Free spots
 Solution: Andrey Grigorov}
 
{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem10703 (input, output);
{$APPTYPE CONSOLE}
Var
  Board: Array [1..500,1..500] of Boolean;
  i,j,W,H,N,X1,Y1,X2,Y2,Change,dx,dy: Integer;
  S: LongInt;

Begin
  ReadLn(W,H,N);
  While (W <> 0) or (H <> 0) or (N <> 0) do
    Begin
      FillChar(Board,SizeOf(Board),True);
      S:=W*H;
      While N >= 1 do
        Begin
          ReadLn(X1,Y1,X2,Y2);
          if X1 <= X2 then
            dx:=1
          else
            dx:=-1;
          if Y1 <= Y2 then
            dy:=1
          else
           dy:=-1;
          i:=X1;
          While (i-dx) <> X2 do
            Begin
              j:=Y1;
              While (j-dy) <> Y2 do
                Begin
                  if Board[i,j] then
                    Begin
                      Board[i,j]:=False;
                      Dec(S);
                    end;
                  Inc(j,dy);
                end;
              Inc(i,dx);
            end;
          Dec(N);
        end;
      Case S of
        0: WriteLn('There is no empty spots.');
        1: WriteLn('There is one empty spot.');
       else
         WriteLn('There are ',S,' empty spots.');
       end;
      ReadLn;
      ReadLn(W,H,N);
    end;
end.