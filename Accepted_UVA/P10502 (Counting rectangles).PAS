{Problem 10502 - Counting rectangles
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem10502 (input,output);
Var
  T: Array [0..100,1..100] of Byte;
  i,j,g,N,M,min: Integer;
  RectAmount: LongInt;
  Ch: Char;

Begin
  ReadLn(N);
  if N <> 0 then
    ReadLn(M);
  While (N <> 0) and (M <> 0) do
    Begin
      FillChar(T,SizeOf(T),0);
      for i:=1 to N do
        Begin
          for j:=1 to M do
            Begin
              Read(Ch);
              if Ch = '1' then
                T[i,j]:=T[i-1,j]+1;
            end;
          ReadLn;
        end;
      RectAmount:=0;
      for i:=1 to N do
        for j:=1 to M do
          Begin
            min:=T[i,j];
            for g:=j to M do
              Begin
                if min > T[i,g] then
                  min:=T[i,g];
                if min = 0 then
                  Break;
                Inc(RectAmount,min);
              end;
          end;
      WriteLn(RectAmount);
      ReadLn(N);
      if N <> 0 then
        ReadLn(M);
    end;
end.