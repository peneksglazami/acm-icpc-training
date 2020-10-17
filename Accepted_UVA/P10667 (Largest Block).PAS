{Problem 10667 - Largest Block
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10667 (input,output);
Var
  B: Array [1..100,1..100] of Boolean;
  T: Array [0..100,1..100] of Byte;
  R: Array [1..100,1..100] of Word;
  i,j,g,P,S,N,r1,r2,c1,c2,max,min: Integer;

Begin
  ReadLn(P);
  While P > 0 do
    Begin
      FillChar(B,SizeOf(B),True);
      FillChar(T,SizeOf(T),0);
      FillChar(R,SizeOf(R),0);
      ReadLn(S);
      ReadLn(N);
      While N > 0 do
        Begin
          ReadLn(r1,c1,r2,c2);
          for i:=r1 to r2 do
            for j:=c1 to c2 do
              B[i,j]:=False;
          Dec(N);
        end;
      for i:=1 to S do
        for j:=1 to S do
          if B[i,j] then
            T[i,j]:=T[i-1,j]+1;
      max:=0;
      for i:=1 to S do
        for j:=1 to S do
          Begin
            min:=T[i,j];
            for g:=j to S do
              Begin
                if min > T[i,g] then
                  min:=T[i,g];
                if min = 0 then
                  Break;
                if R[i,g] < min*(g-j+1) then
                  Begin
                    R[i,g]:=min*(g-j+1);
                    if max < R[i,g] then
                      max:=R[i,g];
                  end;
              end;
          end;
      WriteLn(max);
      Dec(P);
    end;
end.