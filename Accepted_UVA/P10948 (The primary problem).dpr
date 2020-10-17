{Problem: 10948 - The primary problem
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program P10948 (input,output);
{$APPTYPE CONSOLE}
Var
  p :Array [0..100000] of Integer;
  a: Array [1..1000000] of Boolean;
  i,N: Integer;
  OK: Boolean;
  
Procedure Prime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  p[0]:=1;
  p[1]:=2;
  a[2]:=True;
  i:=3;
  While i <= 1000000 do
    Begin
      j:=1;
      Ok:=True;
      While (j <= p[0]) and Ok and (p[j]*p[j] <= i) do
        Begin
          Ok:=i mod p[j] <> 0;
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(p[0]);
          p[p[0]]:=i;
          a[i]:=True;
        end;
      Inc(i,2);
    end;
end;

Begin
  Prime;
  ReadLn(N);
  While N <> 0 do
    Begin
      Ok:=False;
      WriteLn(N,':');
      for i:=1 to p[0] do
        if p[i] <= N-p[i] then
          Begin
            if a[N-p[i]] then
              Begin
                WriteLn(p[i],'+',N-p[i]);
                Ok:=True;
                Break;
              end;
          end
        else
          Break;
      if not Ok then
        WriteLn('NO WAY!');
      ReadLn(N);
    end;
end.