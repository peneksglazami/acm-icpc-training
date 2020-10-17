{Problem: 10684 - The jackpot
 Author: David Deharbe
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10684 (input,output);
Const
  MaxN = 10000;

Var
  A: Array [0..MaxN] of LongInt;
  i,N,imax: Integer;

Begin
  {Assign(Input,'input.txt');
  Assign(Output,'output.txt');
  Reset(Input);
  ReWrite(Output);}
  Read(N);
  While N <> 0 do
    Begin
      a[0]:=0;
      for i:=1 to N do
        Begin
          Read(a[i]);
          if a[i] < a[i-1]+a[i] then
            a[i]:=a[i-1]+a[i];
        end;
      imax:=0;
      for i:=1 to N do
        if a[i] > a[imax] then
          imax:=i;
      if imax = 0 then
        WriteLn('Losing streak.')
      else
        WriteLn('The maximum winning streak is ',a[imax],'.');
      Read(N);
    end;
  {Close(Input);
  Close(Output);}
end.