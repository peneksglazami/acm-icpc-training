{ACM ICPC 2003/2004 North America - Mid Atlantic
 Problem A - A Contesting Decision
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem2832 (input, output);
Type
  Team = Record
    Name: String;
    ProblemSolved,Penalty: Integer;
   end;

Var
  BestT,T: Team;
  Ch: Char;
  i,N,S,Time: Integer;

Begin
  BestT.Name:='';
  BestT.Penalty:=-1;
  BestT.ProblemSolved:=-1;
  ReadLn(N);
  While N > 0 do
    Begin
      Ch:=#0;
      T.Name:='';
      T.Penalty:=0;
      T.ProblemSolved:=0;
      While Ch <> ' ' do
        Begin
          Read(Ch);
          if Ch <> ' ' then
            T.Name:=T.Name+Ch;
        end;
      for i:=1 to 4 do
        Begin
          Read(S,Time);
          if Time <> 0 then
            Begin
              Inc(T.ProblemSolved);
              T.Penalty:=T.Penalty+Time+20*(S-1);
            end;
        end;
      ReadLn;
      if (T.ProblemSolved > BestT.ProblemSolved) or
         ((T.ProblemSolved = BestT.ProblemSolved) and (T.Penalty < BestT.Penalty))
           then
             BestT:=T;
      Dec(N);
    end;
  WriteLn(BestT.Name,' ',BestT.ProblemSolved,' ',BestT.Penalty);
end.