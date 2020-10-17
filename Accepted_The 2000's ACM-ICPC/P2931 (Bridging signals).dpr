{Problem: 2931 - Briging signals
 Problem A - The 2003 ACM ICPC Northwestern Europe Regional Contest
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem2931 (input,output);
{$APPTYPE CONSOLE}
Var
  a: Array [0..40000] of Integer;
  i,k,l,r,x,m,N,Test: Integer;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn(N);
      ReadLn(a[1]);
      k:=1;
      for i:=2 to N do
        Begin
          ReadLn(x);
          l:=0; r:=k+1;
          While r-l <> 1 do
            Begin
              m:=(l+r) div 2;
              if a[m] >= x then
                r:=m
              else
                l:=m;
            end;
          if l = k then
            Begin
              Inc(k);
              a[k]:=x;
            end
          else
            a[l+1]:=x;
        end;
      WriteLn(k);
      Dec(Test);
    end;
end.