{Problem: 459 - Graph Connectivity
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem459 (input,output);
Var
  Mark: Array ['A'..'Z'] of Byte;
  All: Set of Byte;
  St: String[2];
  Test: Integer;
  j,Max: Byte;
  i,S,F,EndNod: Char;

Procedure ChangeMark(a,b: Byte);
Var
  Change: Byte;
  i: Char;
Begin
  if a > b then
    Begin
      Change:=a;
      a:=b;
      b:=Change;
    end;
  for i:='A' to EndNod do
    if Mark[i] = b then
      Mark[i]:=a;
end;

Begin
  ReadLn(Test);
  ReadLn;
  While Test >= 1 do
    Begin
      ReadLn(EndNod);
      for i:='A' to EndNod do
        Mark[i]:=Ord(i)-Ord('A')+1;
      ReadLn(St);
      While (St <> '') do
        Begin
          S:=St[1];
          F:=St[2];
          if (S <> ' ') and (F <> ' ') then
            ChangeMark(Mark[S],Mark[F])
          else
            Break;
          ReadLn(St);
        end;
      All:=[];
      for i:='A' to EndNod do
        All:=All+[Mark[i]];
      Max:=0;
      for j:=1 to Ord(EndNod)-Ord('A')+1 do
        if j in All then
          Inc(Max);
      WriteLn(Max);
      if Test <> 1 then
        WriteLn;
      Dec(Test);
    end;
end.