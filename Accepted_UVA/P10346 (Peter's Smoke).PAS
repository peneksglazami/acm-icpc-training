{Problem 10346 - Peter's Smoke
 Source: University of Alberta Local Contest
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10346 (input, output);
Var
  N,K,butts,S: LongInt;

Begin
  While not EOF do
    Begin
      S:=0;
      butts:=0;
      ReadLn(N,K);
      While N <> 0 do
        Begin
          Inc(S,N);
          Inc(butts,N);
          N:=(butts div K);
          Dec(butts,N*K);
        end;
      WriteLn(S);
    end;
end.