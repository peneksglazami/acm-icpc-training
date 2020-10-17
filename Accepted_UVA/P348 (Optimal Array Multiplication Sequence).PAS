{Problem: 348 - Optimal Array Multiplication Sequence
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem348 (input,output);
Var
  r,c: Array [1..10] of LongInt;
  t: Array [1..10,1..10] of LongInt;
  tt: Array [1..10,1..10] of Integer;
  i,j,k,g,N,n_case: Integer;

Function GetRes(i,j: Integer): String;
Var
  St: String;
Begin
  if i = j then
    Begin
      Str(i,St);
      GetRes:='A'+St;
    end
  else
    GetRes:='('+GetRes(i,tt[i,j])+' x '+GetRes(tt[i,j]+1,j)+')';
end;

Begin
  n_case:=0;
  ReadLn(N);
  While N <> 0 do
    Begin
      for i:=1 to N do
        ReadLn(r[i],c[i]);
      for i:=1 to N do
        t[i,i]:=0;
      for k:=1 to N-1 do
        for i:=1 to N-k do
          Begin
            j:=i+k;
            t[i,j]:=MaxLongInt;
            for g:=i to j-1 do
              if t[i,j] > t[i,g]+t[g+1,j]+r[i]*c[g]*c[j] then
                Begin
                  t[i,j]:=t[i,g]+t[g+1,j]+r[i]*c[g]*c[j];
                  tt[i,j]:=g;
                end;
          end;
      Inc(n_case);
      WriteLn('Case ',n_case,': ',GetRes(1,N));
      ReadLn(N);
    end;
end.