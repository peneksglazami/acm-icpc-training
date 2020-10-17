{Problem: 10622 - Perfect Pth Powers
 Author: G. V. Cormack
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10622 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxX = 4294967295;

Var
  a: Array [1..6543] of Integer;
  p: Array [0..6543] of Integer;
  i,j,Min: Integer;
  N: Int64;
  Neg: Boolean;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  p[0]:=0;
  for i:=2 to Round(Sqrt(MaxX))+1 do
    Begin
      Ok:=True;
      j:=1;
      While Ok and (j < p[0]) and (Sqr(p[j]) <= i) do
        Begin
          Ok:=Ok and (i mod p[j] <> 0);
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(p[0]);
          p[p[0]]:=i;
        end;
    end;
end;

Function GCD(a,b: Integer): Integer;
Var
  nd: Integer;
Begin
  nd:=b;
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

Begin
  CreatePrime;
  ReadLn(N);
  While N <> 0 do
    Begin
      Neg:=N < 0;
      N:=Abs(N);
      if N = 1 then
        Begin
          WriteLn('1');
          ReadLn(N);
          Continue;
        end;
      FillChar(a,SizeOf(a),0);
      i:=1;
      While (N <> 1) and (i <= p[0]) do
        Begin
          While N mod p[i] = 0 do
            Begin
              Inc(a[i]);
              N:=N div p[i];
            end;
          Inc(i);
        end;
      if N > 1 then
        WriteLn('1')
      else
        Begin
          j:=1;
          While a[j] = 0 do
            Inc(j);
          Min:=a[j];
          for i:=j+1 to p[0] do
            if a[i] > 0 then
              if Min > a[i] then
                Min:=GCD(a[i],Min);
          if Neg then
            While not Odd(Min) do
              Min:=Min div 2;
          WriteLn(Min);
        end;
      ReadLn(N);
    end;
end.