{ACM ICPC 2001/2002 North America - East Central
 Problem C - Web Navigation
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemC (input, output);
Var
  B,F: Array [1..100] of String;
  Test,FAmount,BAmount: Integer;
  St,CurrentPage: String;
  Ignored: Boolean;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn;
      ReadLn(St);
      BAmount:=0;
      FAmount:=0;
      CurrentPage:='http://www.acm.org/';
      While St <> 'QUIT' do
        Begin
          Ignored:=False;
          Case St[1] of
            'B': if BAmount > 0 then
                   Begin
                     Inc(FAmount);
                     F[FAmount]:=CurrentPage;
                     CurrentPage:=B[BAmount];
                     Dec(BAmount);
                   end
                 else
                   Ignored:=True;

            'F': if FAmount > 0 then
                   Begin
                     Inc(BAmount);
                     B[BAmount]:=CurrentPage;
                     CurrentPage:=F[FAmount];
                     Dec(FAmount);
                   end
                 else
                   Ignored:=True;

            'V': Begin
                   Inc(BAmount);
                   B[BAmount]:=CurrentPage;
                   Delete(St,1,5);
                   While St[1] = ' ' do
                     Delete(St,1,1);
                   CurrentPage:=St;
                   FAmount:=0;
                 end;
           end;
          if not Ignored then
            WriteLn(CurrentPage)
          else
            WriteLn('Ignored');
          ReadLn(St);
        end;
      if Test > 1 then
        WriteLn;
      Dec(Test);
    end;
end.