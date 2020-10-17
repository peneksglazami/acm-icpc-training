{ACM ICPC 2004/2005 Latin America - South America
 Problem G - Grandpa is Famous
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemG (input, output);
Var
  T: Array [1..10000] of Integer;
  i,j,N,M,a,Max,SecMax: Integer;

Begin
  ReadLn(N,M);
  While (N <> 0) or (M <> 0) do
    Begin
      FillChar(T,SizeOf(T),0);
      Max:=0;
      for i:=1 to N do
        Begin
          for j:=1 to M do
            Begin
              Read(a);
              Inc(T[a]);
              if T[a] > Max then
                Max:=T[a];
            end;
          ReadLn;
        end;
      SecMax:=0;
      for i:=1 to 10000 do
        if (T[i] < Max) and (T[i] > SecMax) then
          SecMax:=T[i];
      for i:=1 to 10000 do
        if T[i] = SecMax then
          Write(i,' ');
      WriteLn;
      ReadLn(N,M);
    end;
end.