{ACM ICPC 2000/2001 North America - Greater New York
 Problem C - Digital Roots
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program ProblemC (input,output);
Var
  i,N,S,A: LongInt;
  Ch: Char;

Begin
  Read(Ch);
  While Ch <> '0' do
    Begin
      N:=Ord(Ch)-Ord('0');
      While (Ch in ['0'..'9']) and not EOLn(Input) do
        Begin
          Read(Ch);
          if Ch in ['0'..'9'] then
            Inc(N,Ord(Ch)-Ord('0'));
        end;
      ReadLn;
      While N > 9 do
        Begin
          S:=0;
          A:=N;
          While A <> 0 do
            Begin
              Inc(S,A mod 10);
              A:=A div 10;
            end;
          N:=S;
        end;
      WriteLn(N);
      Read(Ch);
    end;
end.