{Problem: 544 - Heavy Cargo
 Author: Miguel A. Revilla
 Solution: Andrey Grigorov}
 
{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
Program Problem544 (input, output);
{$APPTYPE CONSOLE}
Var
  A: Array [1..200,1..200] of Integer;
  D: Array [1..200] of Integer;
  Cities: Array [1..200] of String[30];
  T: Set of 1..200;
  St: String[30];
  i,j,n_case,N,R,L,Max,NMax,n_city,n1,n2: Integer;
  Ch: Char;
  Ok: Boolean;

Function FMin(a,b: Integer): Integer;
Begin
  if a < b then
    FMin:=a
  else
    FMin:=b;
end;

Function FMax(a,b: Integer): Integer;
Begin
  if a > b then
    FMax:=a
  else
    FMax:=b;
end;

Begin
  ReadLn(N,R);
  n_case:=1;
  While (N <> 0) or (R <> 0) do
    Begin
      FillChar(A,SizeOf(A),0);
      n_city:=0;
      for i:=1 to R do
        Begin
          St:='';
          Ch:=#0;
          Read(Ch);
          While Ch <> ' ' do
            Begin
              St:=St+Ch;
              Read(Ch);
            end;
          Ok:=True;
          for j:=1 to n_city do
            if St = Cities[j] then
              Begin
                n1:=j;
                Ok:=False;
                Break;
              end;
          if Ok then
            Begin
              Inc(n_city);
              Cities[n_city]:=St;
              n1:=n_city;
            end;
          St:='';
          Read(Ch);
          While Ch = ' ' do
            Read(Ch);
          While Ch <> ' ' do
            Begin
              St:=St+Ch;
              Read(Ch);
            end;
          Ok:=True;
          for j:=1 to n_city do
            if St = Cities[j] then
              Begin
                n2:=j;
                Ok:=False;
                Break;
              end;
          if Ok then
            Begin
              Inc(n_city);
              Cities[n_city]:=St;
              n2:=n_city;
            end;
          ReadLn(L);
          A[n1,n2]:=L;
          A[n2,n1]:=L;
        end;
      St:='';
      Ch:=#0;
      Read(Ch);
      While Ch <> ' ' do
        Begin
          St:=St+Ch;
          Read(Ch);
        end;
      for j:=1 to n_city do
        if St = Cities[j] then
          Begin
            n1:=j;
            Break;
          end;
      St:='';
      Read(Ch);
      While Ch = ' ' do
        Read(Ch);
      St:=St+Ch;
      While (Ch <> ' ') and not EOLn do
        Begin
          Read(Ch);
          if not EOF then
            St:=St+Ch;
        end;
      for j:=1 to n_city do
        if St = Cities[j] then
          Begin
            n2:=j;
            Break;
          end;
      for i:=1 to N do
        D[i]:=A[n1,i];
      T:=[1..N]-[n1];
      While T <> [] do
        Begin
          Max:=0;
          NMax:=0;
          for i:=1 to N do
            if (i in T) and (D[i] >= Max) then
              Begin
                Max:=D[i];
                NMax:=i;
              end;
          T:=T-[NMax];
          for i:=1 to N do
            if (i in T) then
              D[i]:=FMax(D[i],FMin(D[NMax],A[NMax,i]));
        end;
      WriteLn('Scenario #',n_case);
      WriteLn(D[n2],' tons');
      WriteLn;
      ReadLn(N,R);
      Inc(n_case);
    end;
end.