{Problem: 392 - Polynomial Showdown
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem392 (input, output);
Var
  A: Array [0..8] of Integer;
  i,Max: Integer;

Begin
  While not EOF do
    Begin
      Max:=0;
      for i:=8 downto 0 do
        Begin
          Read(A[i]);
          if (A[i] <> 0) and (Max < i) then
            Max:=i;
        end;
      if A[Max] < 0 then
        Write('-');
      if ((Abs(A[Max]) <> 1) and (Max > 0)) or (Max = 0) then
        Write(Abs(A[Max]));
      if Max > 1 then
        Write('x^',Max,' ')
      else
        if Max = 1 then
          Write('x ');
      for i:=Max-1 downto 0 do
        if A[i] <> 0 then
          Begin
            if A[i] < 0 then
              Write('- ')
            else
              Write('+ ');
            if ((Abs(A[i]) <> 1) and (i > 0)) or (i = 0) then
              Write(Abs(A[i]));
            if i > 1 then
              Write('x^',i,' ')
            else
              if i = 1 then
                Write('x ');
          end;
      WriteLn;
    end;
end.