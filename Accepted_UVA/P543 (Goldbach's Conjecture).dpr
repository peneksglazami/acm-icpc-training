{Problem: 543 - Goldbach's Conjecture
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem543 (input,output);
{$APPTYPE CONSOLE}
Var
  a: Array [2..1000000] of Boolean;
  p: Array [0..78498] of Integer;
  i,p1,p2,N: Integer;
  Ok: Boolean;

Procedure Prime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  FillChar(a,SizeOf(a),False);
  p[0]:=1;
  p[1]:=2;
  a[2]:=True;
  i:=3;
  While i <= 1000000 do
    Begin
      j:=1;
      Ok:=True;
      While Ok and (j <= p[0]) and (Sqr(p[j]) <= i) do
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
      i:=1;
      Ok:=False;
      While p[i] <= N div 2 do
        Begin
          if a[N-p[i]] then
            Begin
              p1:=p[i];
              p2:=N-p[i];
              Ok:=True;
              Break;
            end;
          Inc(i);
        end;
      if Ok then
        WriteLn(N,' = ',p1,' + ',p2)
      else
        WriteLn('Goldbach''s conjecture is wrong.');
      ReadLn(N);
    end;
end.