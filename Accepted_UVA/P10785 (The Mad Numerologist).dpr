{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S+,T-,U-,V+,W-,X+,Y+,Z1}
Program ProblemC (input, output);
{$APPTYPE CONSOLE}
Const
  V: Array [1..5] of Char =
    ('A','U','E','O','I');
  C: Array [1..21] of Char =
    ('J','S','B','K','T','C','L','D','M','V','N','W','F','X',
     'G','P','Y','H','Q','Z','R');
  Vowels:  Set of Char = ['A','U','E','O','I'];
Var

  ABC: Array ['A'..'Z'] of Byte;
  T1: Array [1..5] of Byte;
  T2: Array [1..21] of Byte;
  i,j,N,T,nv,nc: Integer;
  St: String;
  Ch: Char;

Begin
  ReadLn(T);
  for i:=1 to T do
    Begin
      FillChar(T1,SizeOf(T1),21);
      FillChar(T2,SizeOf(T2),5);
      FillChar(ABC,SizeOf(ABC),0);
      ReadLn(N);
      nv:=1;
      nc:=1;
      for j:=1 to N do
        if Odd(j) then
          Begin
            if T1[nv] = 0 then
              Inc(nv);
            Inc(ABC[V[nv]]);
            Dec(T1[nv]);
          end
        else
          Begin
            if T2[nc] = 0 then
              Inc(nc);
            Inc(ABC[C[nc]]);
            Dec(T2[nc]);
          end;
      ST:='';
      j:=1;
      While j <= N do
        Begin
          if Odd(j) then
            Begin
              Ch:='A';
              While (ABC[Ch] = 0) or not(Ch in Vowels) do
                Ch:=Chr(Ord(Ch)+1);
              St:=St+Ch;
              Dec(ABC[Ch]);
            end
          else
            Begin
              Ch:='A';
              While (ABC[Ch] = 0) or (Ch in Vowels) do
                Ch:=Chr(Ord(Ch)+1);
              St:=St+Ch;
              Dec(ABC[Ch]);
            end;
          Inc(j);
        end;
      WriteLn('Case ',i,': ',St);
    end;
end.