{Problem: 215 - Spreadsheet Calculator
 ACM ICPC World Finals - 1992 - Problem A
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem215 (input,output);
Var
  D: Array ['A'..'T','0'..'9','A'..'T','0'..'9'] of Boolean;
  T: Array ['A'..'T','0'..'9'] of String[100];
  B: Array ['A'..'T','0'..'9'] of Boolean;
  i,j,R,C: Integer;
  Ch1,Ch2: Char;
  St: String;

Function Trans: Boolean;
Var
  i: Integer;
  St: String;
  Ch1,Ch2,Ch3,Ch4,Ch5,Ch6: Char;
  Ok: Boolean;
Begin
  FillChar(D,SizeOf(D),False);
  for Ch1:='A' to Chr(Ord('A')+R-1) do
    for Ch2:='0' to Chr(Ord('0')+C-1) do
      Begin
        St:=T[Ch1,Ch2];
        for i:=1 to Length(St) do
          if St[i] in ['A'..'T'] then
            D[Ch1,Ch2,St[i],St[i+1]]:=True;
      end;
  for Ch1:='A' to Chr(Ord('A')+R-1) do
    for Ch2:='0' to Chr(Ord('0')+C-1) do
      for Ch3:='A' to Chr(Ord('A')+R-1) do
        for Ch4:='0' to Chr(Ord('0')+C-1) do
          for Ch5:='A' to Chr(Ord('A')+R-1) do
            for Ch6:='0' to Chr(Ord('0')+C-1) do
              D[Ch3,Ch4,Ch5,Ch6]:=D[Ch3,Ch4,Ch5,Ch6] or (D[Ch3,Ch4,Ch1,Ch2] and D[Ch1,Ch2,Ch5,Ch6]);
  Ok:=False;
  FillChar(B,SizeOf(B),False);
  for Ch1:='A' to Chr(Ord('A')+R-1) do
    for Ch2:='0' to Chr(Ord('0')+C-1) do
      for Ch3:='A' to Chr(Ord('A')+R-1) do
        for Ch4:='0' to Chr(Ord('0')+C-1) do
          if D[Ch1,Ch2,Ch3,Ch4] and D[Ch3,Ch4,Ch1,Ch2] then
            Begin
              B[Ch1,Ch2]:=True;
              B[Ch3,Ch4]:=True;
              Ok:=True;
            end;
  for Ch1:='A' to Chr(Ord('A')+R-1) do
    for Ch2:='0' to Chr(Ord('0')+C-1) do
      for Ch3:='A' to Chr(Ord('A')+R-1) do
        for Ch4:='0' to Chr(Ord('0')+C-1) do
          if D[Ch1,Ch2,Ch3,Ch4] and B[Ch3,Ch4] then
            B[Ch1,Ch2]:=True;
  Trans:=Ok;
end;

Function Res(St: String): String;
Var
  i,minus,plus,Er: Integer;
  R,K: LongInt;
  S: String;
  Z: Char;
Begin
  i:=1;
  While St[1] = ' ' do
    Delete(St,1,1);
  St:=St+' ';
  While i <= Length(St[i]) do
    Begin
      if St[i] in ['+','-'] then
        Begin
          j:=i;
          minus:=0;
          plus:=0;
          While (St[i] in ['+','-']) do
            Begin
              if St[i] = '-' then
                Inc(minus)
              else
                Inc(plus);
              Inc(i);
            end;
          Delete(St,j,i-j);
          minus:=minus-plus;
          if minus > 0 then
            if Odd(minus) then
              Insert('-',St,j)
            else
              Insert('+',St,j)
          else
            Insert('+',St,j);
          i:=j;
        end;
      Inc(i);
    end;
  if not (St[1] in ['-','+']) then
    St:='+'+St;
  While i <= Length(St) do
    Begin
      if St[i] in ['A'..'T'] then
        Begin
          S:=Res(T[St[i],St[i+1]]);
          if S[1] = '-' then
            Begin
              if St[i-1] = '+' then
                St[i-1]:='-'
              else
                St[i-1]:='+';
              Delete(S,1,1);
            end;
          Delete(St,i,2);
          Insert(S,St,i);
        end;
      Inc(i);
    end;
  R:=0;
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
  While St <> '' do
    Begin
      i:=2;
      S:='';
      While (i <= Length(St)) and (St[i] in ['0'..'9']) do
        Begin
          S:=S+St[i];
          Inc(i);
        end;
      Val(S,K,Er);
      if St[1] = '-' then
        Dec(R,K)
      else
        Inc(R,K);
      Delete(St,1,i-1);
    end;
  Str(R,St);
  Res:=St;
end;

Begin
  ReadLn(R,C);
  While (R <> 0) or (C <> 0) do
    Begin
      for Ch1:='A' to Chr(Ord('A')+R-1) do
        for Ch2:='0' to Chr(Ord('0')+C-1) do
          ReadLn(T[Ch1,Ch2]);
      if Trans then
        Begin
          for Ch1:='A' to Chr(Ord('A')+R-1) do
            for Ch2:='0' to Chr(Ord('0')+C-1) do
              if B[Ch1,Ch2] then
                WriteLn(Ch1,Ch2,': ',T[Ch1,Ch2]);
        end
      else
        Begin
          Write(' ');
          for Ch1:='0' to Chr(Ord('0')+C-1) do
            Write('     ',Ch1);
          WriteLn;
          for Ch1:='A' to Chr(Ord('A')+R-1) do
            Begin
              Write(Ch1);
              for Ch2:='0' to Chr(Ord('0')+C-1) do
                Begin
                  St:=Res(T[Ch1,Ch2]);
                  While Length(St) < 6 do
                    St:=' '+St;
                  Write(St);
                end;
              WriteLn;
            end;
        end;
      ReadLn(R,C);
      if (R <> 0) or (C <> 0) then
        WriteLn;
    end;
end.