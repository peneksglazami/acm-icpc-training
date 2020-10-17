{Problem: 10038 - Jolly Jumpers
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10038 (input, output);
Var
  A: Array [1..3000] of Integer;
  B: Array [1..3000] of Boolean;
  i,j,N: Integer;
  Ok: Boolean;

Begin
  While not EOF do
    Begin
      FillChar(B,SizeOf(B),False);
      Read(N);
      for i:=1 to N do
        Read(A[i]);
      ReadLn;
      Ok:=True;
      for i:=1 to N-1 do
        if (Abs(A[i]-A[i+1]) > 0) and (Abs(A[i]-A[i+1]) < N) then
          if not B[Abs(A[i]-A[i+1])] then
            B[Abs(A[i]-A[i+1])]:=True
          else
            Begin
              Ok:=False;
              Break;
            end
        else
          Begin
            Ok:=False;
            Break;
          end;
      if Ok then
        WriteLn('Jolly')
      else
        WriteLn('Not jolly');
    end;
end.