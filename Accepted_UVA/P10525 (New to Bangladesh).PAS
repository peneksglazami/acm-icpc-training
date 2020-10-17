{Problem: 10525 - New to Bangladesh?
 Authors: Anupam & Shabuj (BUET PESSIMISTIC)
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10525 (input, output);
Type
  Road = Record
    T,L: Integer;
   end;

Var
  Z: Array [1..100,1..100] of Road;
  i,j,g,a,b,c,d,m,s,f,X,Y,Q,Test: Integer;

Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn;
      ReadLn(X,Y);
      for j:=1 to X do
        for g:=1 to X do
          Begin
            Z[j,g].T:=MaxInt div 2;
            Z[j,g].L:=MaxInt div 2;
          end;
      for j:=1 to X do
        Begin
          Z[j,j].T:=0;
          Z[j,j].L:=0;
        end;
      for j:=1 to Y do
        Begin
          ReadLn(a,b,c,d);
          Z[a,b].T:=c;
          Z[a,b].L:=d;
          Z[b,a].T:=c;
          Z[b,a].L:=d;
        end;
      for m:=1 to X do
        for j:=1 to X do
          for g:=1 to X do
            Begin
              if (Z[j,g].T > Z[j,m].T+Z[m,g].T) then
                Begin
                  Z[j,g].T:=Z[j,m].T+Z[m,g].T;
                  Z[j,g].L:=Z[j,m].L+Z[m,g].L;
                end;
              if (Z[j,g].T = Z[j,m].T+Z[m,g].T) and (Z[j,g].L > Z[j,m].L+Z[m,g].L) then
                Z[j,g].L:=Z[j,m].L+Z[m,g].L;
            end;
      ReadLn(Q);
      for j:=1 to Q do
        Begin
          ReadLn(s,f);
          if Z[s,f].T <> MaxInt div 2 then
            WriteLn('Distance and time to reach destination is ',Z[s,f].L,' & ',Z[s,f].T,'.')
          else
            WriteLn('No Path.');
        end;
      if i <> Test then
        WriteLn;
    end;
end.