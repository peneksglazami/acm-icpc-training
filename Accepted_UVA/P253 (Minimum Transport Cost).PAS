{Problem: 523 - Minimum Transport Cost
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem523 (input,output);
Const
  NMax = 100;

Var
  D,P: Array [1..NMax,1..NMax] of Integer;
  B: Array [1..NMax] of Integer;
  i,j,m,N,S,F,N_Case,Er: Integer;
  St: String;

Procedure Way(i,j: Integer);
Begin
  if P[i,j] = i then
    begin
      if i <> j then
        Write('-->',j)
    end
  else
    Begin
      Way(i,P[i,j]);
      Way(P[i,j],j);
    end
end;

Begin
  ReadLn(N_Case);
  ReadLn;
  While N_Case > 0 do
    Begin
      N:=0;
      While not EOLn do
        Begin
          Inc(N);
          Read(D[1,N]);
        end;
      for i:=2 to N do
        Begin
          for j:=1 to N do
            Read(D[i,j]);
          ReadLn;
        end;
      for i:=1 to N do
        Read(B[i]);
      ReadLn;
      for i:=1 to N do
        for j:=1 to N do
          P[i,j]:=i;
      for m:=1 to N do
        for i:=1 to N do
          for j:=1 to N do
            if (D[i,m] <> -1) and (D[m,j] <> -1) then
              if (D[i,j] > D[i,m]+D[m,j]+B[m]) or (D[i,j] = -1) then
                Begin
                  D[i,j]:=D[i,m]+D[m,j]+B[m];
                  P[i,j]:=P[m,j];
                end;
      St:=' ';
      While not EOF and (St <> '') do
        Begin
          ReadLn(St);
          if St <> '' then
            Begin
              Val(Copy(St,1,Pos(' ',St)-1),S,Er);
              Delete(St,1,Pos(' ',St));
              Val(St,F,Er);
              WriteLn('From ',S,' to ',F,' :');
              Write('Path: ',S);
              Way(S,F);
              WriteLn;
              WriteLn('Total cost : ',D[S,F]);
            end;
          if not EOF and (St <> '') then
            WriteLn;
        end;
      Dec(N_Case);
    end;
end.