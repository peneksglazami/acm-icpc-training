{Problem: 507 - Jill Rides Again
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem507 (input,output);
Const
  MaxN = 20000;

Var
  a,l: Array [1..MaxN] of Integer;
  i,S,imax,n_case,b: Integer;

Begin
  ReadLn(b);
  n_case:=0;
  While b > 0 do
    Begin
      ReadLn(S);
      ReadLn(a[1]);
      l[1]:=1;
      imax:=1;
      for i:=2 to S-1 do
        Begin
          ReadLn(a[i]);
          l[i]:=i;
          if a[i] <= a[i-1]+a[i] then
            Begin
              a[i]:=a[i-1]+a[i];
              l[i]:=l[i-1];
            end;
          if (a[imax] < a[i]) or ((a[imax] = a[i]) and (imax-l[imax] < i-l[i])) then
            imax:=i;
        end;
      Inc(n_case);
      if a[imax] > 0 then
        WriteLn('The nicest part of route ',n_case,' is between stops ',l[imax],' and ',imax+1)
      else
        WriteLn('Route ',n_case,' has no nice parts');
      Dec(b);
    end;
end.