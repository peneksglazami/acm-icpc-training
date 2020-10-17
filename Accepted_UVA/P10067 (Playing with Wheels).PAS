{Problem: 10067 - Playing with Wheels
 Problem C - BUET/UVA Occidental Contest 1 
 Author: Rezaul Alam Chowdhury
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10067 (input, output);
Type
  Mas = Array [1..4] of Byte;

Var
  F: Array [0..9999] of Boolean;
  Table: Array [0..9999] of Word;
  Stack,OldStack: Array [0..5000] of Word;
  S: Mas;
  i,j,g,Test,X,Step,T: Integer;
  Ok: Boolean;

Procedure Init;
Var
  j,g,a,X,N: Integer;
Begin
  FillChar(F,SizeOf(F),False);
  FillChar(Table,SizeOf(Table),0);
  for j:=1 to 4 do
    Read(S[j]);
  ReadLn;
  T:=0;
  for j:=1 to 4 do
    Begin
      Read(X);
      T:=T*10+X;
    end;
  ReadLn;
  ReadLn(N);
  for j:=1 to N do
    Begin
      X:=0;
      for g:=1 to 4 do
        Begin
          Read(a);
          X:=X*10+a;
        end;
      F[X]:=True;
      ReadLn;
    end;
  ReadLn;
end;

Procedure MakeX(A: Mas; Var X: Integer);
Var
  i: 1..4;
Begin
  X:=0;
  for i:=1 to 4 do
    X:=X*10+A[i];
end;

Procedure MakeS(Var A: Mas; X: Integer);
Var
  i: 1..4;
Begin
  for i:=4 downto 1 do
    Begin
      A[i]:=X mod 10;
      X:=X div 10;
    end;
end;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      Init;
      MakeX(S,X);
      OldStack[0]:=1;
      OldStack[1]:=X;
      Step:=1;
      Ok:=False;
      MakeX(S,X);
      if X = T then
        Ok:=True;
      While not Ok and (OldStack[0] <> 0) do
        Begin
          FillChar(Stack,SizeOf(Stack),0);
          for j:=1 to OldStack[0] do
            Begin
              MakeS(S,OldStack[j]);
              for g:=1 to 4 do
                Begin
                  {i - Left}
                  if S[g] <> 0 then
                    S[g]:=S[g]-1
                  else
                    S[g]:=9;
                  MakeX(S,X);
                  if (Table[X] = 0) and not F[X] then
                    Begin
                      Table[X]:=Step;
                      Inc(Stack[0]);
                      Stack[Stack[0]]:=X;
                      if (T = X) then
                        Begin
                          Ok:=True;
                          Break;
                        end;
                    end;
                  if S[g] <> 9 then
                    S[g]:=S[g]+1
                  else
                    S[g]:=0;
                  {i - Right}
                  if S[g] <> 9 then
                    S[g]:=S[g]+1
                  else
                    S[g]:=0;
                  MakeX(S,X);
                  if (Table[X] = 0) and not F[X] then
                    Begin
                      Table[X]:=Step;
                      Inc(Stack[0]);
                      Stack[Stack[0]]:=X;
                      if (T = X) then
                        Begin
                          Ok:=True;
                          Break;
                        end;
                    end;
                  if S[g] <> 0 then
                    S[g]:=S[g]-1
                  else
                    S[g]:=9;
                end;
            end;
          OldStack:=Stack;
          Inc(Step);
        end;
      if Ok then
        WriteLn(Table[T])
      else
        WriteLn('-1');
    end;
end.