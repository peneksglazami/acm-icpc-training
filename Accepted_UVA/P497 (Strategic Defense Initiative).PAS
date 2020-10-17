{Problem: 497 - Strategic Defense Initiative
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem497 (input,output);
Const
  MaxN = 10000;

Var
  a,p,len: Array [1..MaxN] of Integer;
  i,j,N,Test,imax,Er: Integer;
  St: String;

Procedure Print(i: Integer);
Begin
  if p[i] <> 0 then
    Print(p[i]);
  WriteLn(a[i]);
end;

Begin
  ReadLn(Test);
  ReadLn;
  While Test > 0 do
    Begin
      N:=0;
      ReadLn(St);
      While St <> '' do
        Begin
          Inc(N);
          Val(St,a[N],Er);
          ReadLn(St);
        end;
      FillChar(p,SizeOf(p),0);
      for i:=1 to N do
        len[i]:=1;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if a[i] < a[j] then
            if len[i]+1 > len[j] then
              Begin
                len[j]:=len[i]+1;
                p[j]:=i;
              end;
      imax:=1;
      for i:=2 to N do
        if len[imax] < len[i] then
          imax:=i;
      WriteLn('Max hits: ',len[imax]);
      Print(imax);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.