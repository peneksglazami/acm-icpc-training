{Problem: 256 - Quicksome Squares
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem256 (input,output);
Const
  A: Array [1..22] of String =
  ('00',
   '01',
   '81',
   '0000',
   '0001',
   '2025',
   '3025',
   '9801',
   '000000',
   '000001',
   '088209',
   '494209',
   '998001',
   '00000000',
   '00000001',
   '04941729',
   '07441984',
   '24502500',
   '25502500',
   '52881984',
   '60481729',
   '99980001');

Var
  i,j,g,N: Integer;

Begin
  While not EOF do
    Begin
      ReadLn(N);
      Case N of
        2: Begin j:=1; g:=3; end;
        4: Begin j:=4; g:=8; end;
        6: Begin j:=9; g:=13; end;
        8: Begin j:=14; g:=22; end
       else
         Begin
           j:=0; g:=0;
         end
       end;
      for i:=j to g do
        WriteLn(a[i]);
    end;
end.