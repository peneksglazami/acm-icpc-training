{ACM ICPC 2001/2002 - North America - Greater New York
 Problem B - P,MTHBGWB
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemB (input, output);
Var
  A: Array [','..'_'] of String;
  L: Array [1..100] of Byte;
  i,j,n_case,Test: Integer;
  S,St,Decode,Code: String;
  Ch: Char;

Procedure Fill_A;
Var
  Ch: Char;
Begin
  for Ch:=',' to '_' do
    A[Ch]:='';
  A['A']:='.-';
  A['B']:='-...';
  A['C']:='-.-.';
  A['D']:='-..';
  A['E']:='.';
  A['F']:='..-.';
  A['G']:='--.';
  A['H']:='....';
  A['I']:='..';
  A['J']:='.---';
  A['K']:='-.-';
  A['L']:='.-..';
  A['M']:='--';
  A['N']:='-.';
  A['O']:='---';
  A['P']:='.--.';
  A['Q']:='--.-';
  A['R']:='.-.';
  A['S']:='...';
  A['T']:='-';
  A['U']:='..-';
  A['V']:='...-';
  A['W']:='.--';
  A['X']:='-..-';
  A['Y']:='-.--';
  A['Z']:='--..';
  A['_']:='..--';
  A[',']:='.-.-';
  A['.']:='---.';
  A['?']:='----';
end;

Begin
  Fill_A;
  ReadLn(Test);
  for n_case:=1 to Test do
    Begin
      ReadLn(St);
      Code:='';
      for i:=1 to Length(St) do
        Begin
          Code:=Code+A[St[i]];
          L[i]:=Length(A[St[i]]);
        end;
      Decode:='';
      for i:=1 to Length(St) do
        Begin
          S:='';
          for j:=1 to L[Length(St)-i+1] do
            S:=S+Code[j];
          Delete(Code,1,j);
          for Ch:=',' to '_' do
            if S = A[Ch] then
              Begin
                Decode:=Decode+Ch;
                Break;
              end;
        end;
      WriteLn(n_case,': '+Decode);
    end;
end.