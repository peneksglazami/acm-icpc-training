{Problem: 231 - Testing the CATCHER
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem231 (input,output);
Const
  MaxN = 1000000;

Var
  a: Array [1..MaxN] of SmallInt;
  i,j,k,test,m: Integer;
  x: SmallInt;

Begin
  test:=0;
  ReadLn(x);
  While x <> -1 do
    Begin
      a[1]:=x; k:=1;
      ReadLn(x);
      While x <> -1 do
        Begin
          i:=0; j:=k+1;
          While j - i > 1 do
            Begin
             m:=(i+j) div 2;
             if a[m] >= x then
               i:=m
             else
               j:=m;
            end;
          if i = k then
            Begin
              Inc(k);
              a[k]:=x;
            end
          else
            a[i+1]:=x;
          ReadLn(x);
        end;
      Inc(test);
      WriteLn('Test #',test,':');
      WriteLn('  maximum possible interceptions: ',k);
      WriteLn;
      ReadLn(x);
    end;
end.