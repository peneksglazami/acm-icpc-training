{ACM ICPC 2001-2002 South Pacific
 Problem A - Prime Digital Roots
 Solved by Grigorov Andrey}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemA (input, output);
Var
  Prime: Array [0..200] of LongInt;
  i,j,A,N: LongInt;
  St1,St2: String;

Procedure CreatePrime;
Var
  i,j: LongInt;
  Ok: Boolean;
Begin
  for i:=2 to 1000 do
    Begin
      Ok:=True;
      j:=1;
      While (j <= Prime[0]) and OK do
        Begin
          Ok:=not (i mod Prime[j] = 0);
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(Prime[0]);
          Prime[Prime[0]]:=i;
        end;
    end;

end;

Function IsPrime(A: LongInt): Boolean;
Var
  j: LongInt;
  Ok: Boolean;
Begin
  Ok:=True;
  j:=1;
  While (j <= Prime[0]) and (Prime[j] <= Round(Sqrt(A))) and Ok do
    Begin
      Ok:=not (A mod Prime[j] = 0);
      Inc(j);
    end;
  if A = 1 then
    Ok:=False;
  IsPrime:=Ok;
end;

Function AddDigit(A: LongInt): LongInt;
Var
  Sum: LongInt;
Begin
  Sum:=0;
  While A <> 0 do
    Begin
      Inc(Sum,A mod 10);
      A:=A div 10;
    end;
  AddDigit:=Sum;
end;

Begin
  CreatePrime;
  ReadLn(N);
  While N <> 0 do
    Begin
      A:=N;
      While not IsPrime(A) and (A > 10) do
        A:=AddDigit(A);
      Str(N,St1);
      While Length(St1) < 7 do
        St1:=' '+St1;
      if IsPrime(A) then
        Begin
          Str(A,St2);
          While Length(St2) < 8 do
            St2:=' '+St2;
        end
      else
        St2:='    none';
      WriteLn(St1,St2);
      ReadLn(N);
    end;
end.