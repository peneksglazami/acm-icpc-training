{Problem 10074 - Take the Land
 Author - Rezaul Alam Chowdhury
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10074 (input, output);
Var
  T,R: Array [0..100,1..100] of Integer;
  i,j,g,M,N,a,min,max: Integer;

Begin
  ReadLn(M,N);
  While (M <> 0) or (N <> 0) do
    Begin
      FillChar(T,SizeOf(T),0);
      FillChar(R,SizeOf(R),0);
      for i:=1 to M do
        Begin
          for j:=1 to N do
            Begin
              Read(a);
              if a = 0 then
                T[i,j]:=T[i-1,j]+1;
            end;
          ReadLn;
        end;
      max:=0;
      for i:=1 to M do
        for j:=1 to N do
          Begin
            min:=T[i,j];
            for g:=j to N do
              Begin
                if min > T[i,g] then
                  min:=T[i,g];
                if min = 0 then
                  Break;
                if R[i,g] < min*(g-j+1) then
                  Begin
                    R[i,g]:=min*(g-j+1);
                    if R[i,g] > max then
                      max:=R[i,g];
                  end;
              end;
          end;
      WriteLn(max);
      ReadLn(M,N);
    end;
end.