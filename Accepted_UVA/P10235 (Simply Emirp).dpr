{Problem: 10235 - Simply Emirp
 Author: Arun Kishore
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10235 (input,output);
{$APPTYPE CONSOLE}
Var
  Prime: Array [0..168] of Integer;
  i,N,RevN,Er: Integer;
  St,S: String;

Procedure CreatePrimes;
Var
  i,j: Integer;
  OK: Boolean;
Begin
  FillChar(Prime,SizeOf(Prime),0);
  for i:=2 to 1000 do
    Begin
      j:=1;
      OK:=True;
      While (j <= Prime[0]) and (i >= Sqr(Prime[j])) and OK do
        Begin
          OK:=i mod Prime[j] <> 0;
          Inc(j);
        end;
      if OK then
        Begin
          Inc(Prime[0]);
          Prime[Prime[0]]:=i;
        end;
    end;
end;

Function IsPrime(N: Integer): Boolean;
Var
  i: Integer;
Begin
  i:=1;
  Result:=(N > 1);
  While (i <= Prime[0]) and (N >= Sqr(Prime[i])) and Result do
    Begin
      Result:=N mod Prime[i] <> 0;
      Inc(i);
    end;
end;

Begin
  CreatePrimes;
  While not EOF do
    Begin
      ReadLn(N);
      if not IsPrime(N) then
        WriteLn(N,' is not prime.')
      else
        Begin
          Str(N,St);
          S:='';
          for i:=1 to Length(St) do
            S:=St[i]+S;
          Val(S,RevN,Er);
          if (IsPrime(RevN)) and (RevN <> N) then
            WriteLn(N,' is emirp.')
          else
            WriteLn(N,' is prime.');
        end;
    end;
end.