{Problem: 160 - Factor and Factorials
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem160 (input, output);
Var
  P: Array [2..100] of Boolean;
  pp: Array [2..100] of Integer;
  N,i,a: Integer;
  St: String;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  FillChar(P,SizeOf(P),False);
  for i:=2 to 100 do
    Begin
      P[i]:=True;
      for j:=2 to Round(Sqrt(i)) do
        P[i]:=P[i] and (i mod j <> 0);
    end;
end;

Function K(p,N: Integer): Integer;
Var
  S,q: Integer;
Begin
  S:=0;
  q:=p;
  While (N div q) > 0 do
    Begin
      Inc(S,N div q);
      q:=q*p;
    end;
  K:=S;
end;

Function ToSt(a: Integer): String;
Var
  St: String;
Begin
  Str(a,St);
  While Length(St) < 3 do
    St:=' '+St;
  ToSt:=St;
end;

Begin
  CreatePrime;
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(pp,SizeOf(pp),0);
      for i:=2 to N do
        if p[i] then
          pp[i]:=K(i,N);
      Str(N,St);
      While Length(St) < 3 do
        St:=' '+St;
      Write(St,'! =');
      a:=0;
      for i:=2 to N do
        if pp[i] <> 0 then
          Begin
            if a = 15 then
              Begin
                a:=0;
                WriteLn;
                Write('      ');
              end;
            Write(ToSt(pp[i]));
            Inc(a);
          end;
      WriteLn;
      ReadLn(N);
    end;
end.