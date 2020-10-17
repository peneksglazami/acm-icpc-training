{ACM ICPC 2002/2003 North America - Greater New York
 Problem B - The Drunk Jailer
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemB (input, output);
Var
  i,j,Test,N,Sum: Integer;
  Lock: Boolean;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn(N);
      Sum:=0;
      for i:=1 to N do
        Begin
          Lock:=True;
          for j:=1 to N do
            if i mod j = 0 then
              Lock:=not Lock;
          if not Lock then
            Inc(Sum);
        end;
      WriteLn(Sum);
      Dec(Test);
    end;
end.