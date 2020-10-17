{ACM ICPC World Finals - Beverly Hills - 2002/2003
 Problem J - Toll
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10537 (input, output);
Var
  A: Array ['A'..'z','A'..'z'] of Boolean;
  B,C: Array ['A'..'z'] of Boolean;
  D: Array ['A'..'z'] of Record S: LongInt; L: Char; end;
  Amount,n_s: LongInt;
  i,j,N,n_case: Integer;
  St: String;
  Ch,Ch2,S,F: Char;
  Nadoelo: Boolean;

Function NewS(S: LongInt): LongInt;
Begin
  if S mod 19 = 0 then
    NewS:=S+(S div 19)
  else
    NewS:=S+(S div 19)+1;
end;

Begin
  ReadLn(N);
  While N <> -1 do
    Begin
      FillChar(A,SizeOf(A),False);
      FillChar(B,SizeOf(B),False);
      for Ch:='A' to 'z' do
        D[Ch].S:=MAxLongInt;
      for i:=1 to N do
        Begin
          ReadLn(St);
          A[St[1],St[3]]:=True;
          A[St[3],St[1]]:=True;
        end;
      ReadLn(Amount,St);
      While not (St[1] in ['A'..'z']) do
        Delete(St,1,1);
      S:=St[1]; F:=St[3];
      B[F]:=True;
      D[F].S:=Amount;
      Repeat
        Nadoelo:=True;
        C:=B;
        FillChar(B,SizeOf(B),False);
        for Ch:='A' to 'z' do
          if C[Ch] then
            for Ch2:='A' to 'z' do
              if A[Ch,Ch2] then
                Begin
                  if Ch in ['A'..'Z'] then
                    n_s:=NewS(D[Ch].S)
                  else
                    n_s:=D[Ch].S+1;
                  if (D[Ch2].S > n_s) or ((D[Ch2].S = n_s) and (D[Ch2].L > Ch)) then
                    Begin
                      Nadoelo:=False;
                      D[Ch2].S:=n_s;
                      D[Ch2].L:=Ch;
                      B[Ch2]:=True;
                    end;
                end;
      Until Nadoelo;
      Inc(n_case);
      WriteLn('Case ',n_case,': ',D[S].S);
      ReadLn(N);
    end;
end.