{ACM ICPC 2004/2005 Latin America - Mexico and Central America
 Problem B - Boolean Expressions
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
Program ProblemB (input, output);
Var
  St: String;
  Ch: Char;
  N_Case: Integer;

Function F_And(A,B: Char): String;
Begin
  if (A = 'V') and (B = 'V') then
    F_And:='V'
  else
    F_And:='F';
end;

Function F_Or(A,B: Char): String;
Begin
  if (A = 'V') or (B = 'V') then
    F_Or:='V'
  else
    F_Or:='F';
end;

Function F_Not(A: Char): String;
Begin
  if (A = 'V') then
    F_Not:='F'
  else
    F_Not:='V';
end;

Function Expression(St: String): String;
Var
  i,n,m,b_amount: Integer;
  Res: String;
Begin
  While Pos('(',St) <> 0 do
    Begin
      n:=Pos('(',St);
      i:=n+1;
      b_amount:=1;
      While b_amount > 0 do
        Begin
          Case St[i] of
            '(': Inc(b_amount);
            ')': Dec(b_amount);
           end;
          Inc(i);
        end;
      m:=i-1;
      Res:=Expression(Copy(St,n+1,m-n-1));
      Delete(St,n,m-n+1);
      Insert(Res,St,n);
    end;

  While Pos('!',St) <> 0 do
    Begin
      n:=Pos('!',St);
      i:=n;
      While St[i] = '!' do
        Inc(i);
      if (i - n) mod 2 = 0 then
        Res:=St[i]
      else
        Res:=F_Not(St[i]);
      Delete(St,n,i-n+1);
      Insert(Res,St,n);
    end;

  While Length(St) > 1 do
    Begin
      Case St[2] of
        '&': Res:=F_And(St[1],St[3]);
        '|': Res:=F_Or(St[1],St[3]);
       end;
      Delete(St,1,3);
      St:=Res+St;
    end;
  Expression:=St;
end;

Begin
  N_Case:=1;
  While not EOF do
    Begin
      St:='';
      While not EOLn do
        Begin
          Read(Ch);
          if Ch <> ' ' then
            St:=St+Ch;
        end;
      ReadLn;
      WriteLn('Expression ',N_Case,': ',Expression(St));
      Inc(N_Case);
    end;
end.