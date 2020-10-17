{ACM ICPC 2001-2002 South Pacific
 Problem E - James Bond
 Solved by Grigorov Andrey}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program ProblemE (input, output);
Var
  D: Array [1..100,1..100] of Integer;
  B: Array [1..100] of Integer;
  Time: Array [1..100] of LongInt;
  R,L,All: Set of 1..100;
  i,j,N,M,S,T,V1,V2,Y: Integer;

Function Min(A,B: LongInt): LongInt;
Begin
  if A < B then
    Min:=A
  else
    Min:=B;
end;

Begin
  ReadLn(N,M,S,T);
  While (N <> 0) or (M <> 0) or (S <> 0) or (T <> 0) do
    Begin
      FillChar(D,SizeOf(D),0);
      for i:=1 to N do
        ReadLn(B[i]);
      for i:=1 to M do
        Begin
          ReadLn(V1,V2,Y);
          D[V1,V2]:=Y;
          D[V2,V1]:=Y;
        end;
      for i:=1 to N do
        Time[i]:=MaxLongInt;
      Time[S]:=0;
      R:=[S];
      All:=R;
      Repeat
        L:=R;
        R:=[];
        for i:=1 to N do
          if i in L then
            for j:=1 to N do
              if (B[j] <> 0) then
                Begin
                  if (D[i,j] <> 0) and (Time[i]+D[i,j] < Min(B[j],Time[j])) then
                    Begin
                      R:=R+[j];
                      Time[j]:=Time[i]+D[i,j];
                      All:=All+[j];
                    end
                end
              else
                if (D[i,j] <> 0) and (Time[i]+D[i,j] < Time[j]) then
                  Begin
                    R:=R+[j];
                    Time[j]:=Time[i]+D[i,j];
                    All:=All+[j];
                  end;
      Until R = [];
      if T in All then
        WriteLn(Time[T])
      else
        WriteLn('0');
      ReadLn(N,M,S,T);
    end;
end.