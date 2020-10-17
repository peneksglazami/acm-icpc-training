{ACM ICPC 2004/2005 North America - Mid Central
 Problem D - Flow Layout
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemD;
Var
  S,T,M,W,H,OldT,MaxW,MaxH,NowW,MaxNowH: Integer;

Begin
  ReadLn(M);
  While M <> 0 do
    Begin
      MaxH:=0;
      MaxW:=0;
      NowW:=0;
      MaxNowH:=0;
      ReadLn(W,H);
      While (W <> -1) and (H <> -1) do
        Begin
          if W+NowW <= M then
            Begin
              if MaxNowH < H then
                MaxNowH:=H;
              Inc(NowW,W);
              if MaxW < NowW then
                MaxW:=NowW;
            end
          else
            Begin
              Inc(MaxH,MaxNowH);
              MaxNowH:=H;
              NowW:=W;
              if MaxW < NowW then
                MaxW:=NowW;
            end;
          ReadLn(W,H);
        end;
      Inc(MaxH,MaxNowH);
      WriteLn(MaxW,' x ',MaxH);
      ReadLn(M);
    end;
end.