{ACM ICPC 2004/2005 North America - Mid Central
 Problem G - Speed Limit
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemG;
Var
  n,S,T,OldT,M: Integer;

Begin
  ReadLn(N);
  While N <> -1 do
    Begin
      OldT:=0;
      M:=0;
      While N > 0 do
        Begin
          ReadLn(S,T);
          M:=M+S*(T-OldT);
          OldT:=T;
          Dec(N);
        end;
      WriteLn(M,' miles');
      ReadLn(N);
    end;
end.