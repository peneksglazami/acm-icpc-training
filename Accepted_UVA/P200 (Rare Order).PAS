{Problem: 200 - Rare Order
 ACM ICPC World Finals - 1989 - Problem A 
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem200 (input,output);
Var
  D: Array ['A'..'Z','A'..'Z'] of Boolean;
  A: Array ['A'..'Z'] of Boolean;
  St1,St2: String[20];
  Ch1,Ch2,Ch3: Char;
  i: Integer;
  Nadoelo,OK: Boolean;

Function Min(a,b: Integer): Integer;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Begin
  FillChar(D,SizeOf(D),False);
  FillChar(A,SizeOf(A),False);
  St1:='';
  ReadLn(St2);
  While St2 <> '#' do
    Begin
      for i:=1 to Length(St2) do
        A[St2[i]]:=True;
      for i:=1 to Min(Length(St1),Length(St2)) do
        if St1[i] <> St2[i] then
          Begin
            D[St1[i],St2[i]]:=True;
            Break;
          end;
      St1:=St2;
      ReadLn(St2);
    end;
  for Ch1:='A' to 'Z' do
    for Ch2:='A' to 'Z' do
      for Ch3:='A' to 'Z' do
        D[Ch2,Ch3]:=D[Ch2,Ch3] or (D[Ch2,Ch1] and D[Ch1,Ch3]);
  Repeat
    Nadoelo:=True;
    for Ch1:='A' to 'Z' do
      if A[Ch1] then
        Begin
          Ok:=True;
          for Ch2:='A' to 'Z' do
            if A[Ch2] then
              Ok:=Ok and (not D[Ch2,Ch1]);
          if Ok then
            Begin
              Nadoelo:=False;
              A[Ch1]:=False;
              Write(Ch1);
              Break;
            end;
        end;
  Until Nadoelo;
end.