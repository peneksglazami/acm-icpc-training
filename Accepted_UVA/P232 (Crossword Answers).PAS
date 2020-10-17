{Problem: 232 - Crossword Answers
 ACM ICPC World Finals - 1994 - Problem C
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem232 (input, output);
Var
  T: Array [0..11,0..11] of Char;
  A: Array [1..10,1..10] of Integer;
  i,j,g,R,C,N,n_case: Integer;
  S: String;

Begin
  Read(R);
  While R <> 0 do
    Begin
      ReadLn(C);
      FillChar(T,SizeOf(T),'*');
      for i:=1 to R do
        Begin
          for j:=1 to C do
            Read(T[i,j]);
          ReadLn;
        end;
      FillChar(A,SizeOf(A),0);
      N:=0;
      for i:=1 to R do
        for j:=1 to C do
          if (T[i,j] <> '*') and ((T[i-1,j] = '*') or (T[i,j-1] = '*')) then
            Begin
              Inc(N);
              A[i,j]:=N;
            end;
      Inc(n_case);
      WriteLn('puzzle #',n_case,':');
      WriteLn('Across');
      for i:=1 to R do
        for j:=1 to C do
          if (A[i,j] <> 0) and (T[i,j-1] = '*') then
            Begin
              g:=j;
              S:='';
              While T[i,g] <> '*' do
                Begin
                  S:=S+T[i,g];
                  Inc(g);
                end;
              WriteLn('  ',A[i,j],'.'+S);
            end;
      WriteLn('Down');
      for i:=1 to R do
        for j:=1 to C do
          if (A[i,j] <> 0) and (T[i-1,j] = '*') then
            Begin
              g:=i;
              S:='';
              While T[g,j] <> '*' do
                Begin
                  S:=S+T[g,j];
                  Inc(g);
                end;
              WriteLn('  ',A[i,j],'.'+S);
            end;
      Read(R);
      if R <> 0 then
        WriteLn;
    end;
end.