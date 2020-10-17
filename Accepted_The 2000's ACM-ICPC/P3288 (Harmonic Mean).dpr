{ACM ICPC 2005/2006 Asia - Dhaka
 Problem A - Harmonic Mean
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem3288 (input,output);
{$APPTYPE CONSOLE}
Var
  a: Array [1..8] of Integer;
  K,S,NOD: Int64;
  i,j,N,M: Integer;

Function GCD(a,b: Int64): Int64;
Var
  nd: Int64;
Begin
  nd:=b;
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

Begin
  {Reset(Input,'input.txt');
  ReWrite(Output,'output.txt');}
  ReadLn(M);
  for i:=1 to M do
    Begin
      Read(N);
      K:=1;
      for j:=1 to N do
        Begin
          Read(a[j]);
          K:=K*a[j];
        end;
      S:=0;
      for j:=1 to N do
        S:=S+K div a[j];
      K:=K*N;
      NOD:=GCD(K,S);
      WriteLn('Case ',i,': ',K div NOD,'/',S div NOD);
    end;
  {CloseFile(Input);
  CloseFile(Output);}
end.
