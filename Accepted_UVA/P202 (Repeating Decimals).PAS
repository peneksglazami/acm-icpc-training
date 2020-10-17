{Problem: 202 - Repeating Decimals
 ACM ICPC World Finals - 1989 - Problem C
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem202 (input, output);
Var
  T: Array [0..3000,0..9] of Integer;
  St: String;
  i,N,M,L: Integer;
  Find: Boolean;

Begin
  While not EOF do
    Begin
      FillChar(T,SizeOf(T),0);
      ReadLn(N,M);
      Write(N,'/',M,' = ',N div M,'.');
      St:='';
      Find:=False;
      i:=0;
      if N >= M then
        N:=N mod M;
      Repeat
        Inc(i);
        L:=10*N div M;
        N:=10*N-L*M;
        St:=St+Chr(Ord('0')+L);
        if T[N,L] <> 0 then
          Find:=True
        else
          T[N,L]:=i;
      Until Find;
      Insert('(',St,T[N,L]);
      Delete(St,Length(St),1);
      if i - T[N,L] > 50 then
        Begin
          St:=Copy(St,T[N,L],51);
          St:=St+'...';
        end;
      St:=St+')';
      WriteLn(St);
      WriteLn('   ',i-T[N,L],' = number of digits in repeating cycle');
      if not EOF then
        WriteLn;
    end;
end.