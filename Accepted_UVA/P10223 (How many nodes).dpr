{Problem: 10223 - How many nodes?
 Author: Ahmed Shamsul Arefin
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10223 (input,output);
{$APPTYPE CONSOLE}
Var
  a: Array [0..20] of Int64;
  N: Cardinal;
  i,l,r: Integer;

Begin
  {Reset(Input,'input.txt');
  ReWrite(Output,'output.txt');}
  a[0]:=1;
  i:=1;
  Repeat
    a[i]:=(a[i-1]*(4*i-2)) div (i+1);
    Inc(i);
  Until a[i-1] > 4294967295;
  Dec(i);
  While not EOF do
    Begin
      ReadLn(N);
      l:=0;
      r:=i;
      While r - l > 1 do
        if a[(l+r) div 2] > N then
          r:=(l+r) div 2
        else
          l:=(l+r) div 2;
      WriteLn(l);
    end;
  {CloseFile(Input);
  CloseFile(Output);}
end.
