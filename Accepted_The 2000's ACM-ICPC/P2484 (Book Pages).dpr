{Problem: 2484 - Book Pages
 ACM ICPC - Oceania - South Pacific - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I+,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S+,T-,U-,V+,W-,X+,Y+}
Program Problem2484 (input,output);
Var
  a,s,ss: Array [0..10] of Int64;
  i,N,Er: Integer;
  St: String;

Begin
  a[0]:=0; s[0]:=0; ss[0]:=0;
  a[1]:=9; s[1]:=9; ss[1]:=9;
  for i:=2 to 10 do
    Begin
      a[i]:=a[i-1]*10;
      s[i]:=s[i-1]+i*a[i];
      ss[i]:=ss[i-1]+a[i];
    end;
  ReadLn(St);
  While St[1] <> '#' do
    Begin
      Val(St,N,Er);
      i:=1;
      While N > s[i] do
        Inc(i);
      if (N-s[i-1]) mod i = 0 then
        WriteLn(ss[i-1]+(N-s[i-1]) div i)
      else
        WriteLn('Impossible!');
      ReadLn(St);
    end;
end.