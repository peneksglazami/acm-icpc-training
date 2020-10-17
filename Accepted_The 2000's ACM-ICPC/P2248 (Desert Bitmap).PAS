{ACM ICPC 2001-2002 South Pacific
 Problem B - Desert Bitmap
 Solved by Grigorov Andrey}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemB (input, output);
Var
  B: Array [1..16] of String[16];
  D: Array [1..64] of String[64];
  i,j,X,Y,B1,B2,D1,D2,Amount: Integer;
  Ok: Boolean;

Begin
  ReadLn(B1,B2);
  While (B1 <> 0) and (B2 <> 0) do
    Begin
      Amount:=0;
      for i:=1 to B1 do
        ReadLn(B[i]);
      ReadLn(D1,D2);
      for i:=1 to D1 do
        ReadLn(D[i]);
      X:=1;
      While X <= (D2-B2+1) do
        Begin
          Y:=1;
          While Y <= (D1-B1+1) do
            Begin
              Ok:=True;
              for i:=1 to B2 do
                if Ok then
                  Begin
                    for j:=1 to B1 do
                      if (B[j][i] = '#') and (B[j][i] <> D[Y+j-1][X+i-1]) then
                        Begin
                          Ok:=False;
                          Break;
                        end
                  end
                else
                  Break;
              if Ok then
                Inc(Amount);
              Inc(Y);
            end;
          Inc(X);
        end;
      WriteLn(Amount);
      ReadLn(B1,B2);
    end;
end.