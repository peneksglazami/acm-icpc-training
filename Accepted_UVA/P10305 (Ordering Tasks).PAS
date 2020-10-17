{Problem: 10305 - Ordering Tasks
 Problem F - GWCF Contest 2 - The Joint Effort Contest
 Author: Rodrigo Malta Schmidt
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}

Program Problem10305 (input, output);
Type
  Task = Record
    Number: Byte;
    Before: Set of 1..100;
   end;

Var
  Tasks: Array [1..100] of Task;
  R: Array [1..100] of Set of 1..100;
  Change: Task;
  i,j,g,N,M: Integer;
  T,S,L: Set of 1..100;

Procedure Init;
Var
  i,a,b: Integer;
Begin
  FillChar(Tasks,SizeOf(Tasks),0);
  for i:=1 to N do
    Tasks[i].Number:=i;
  for i:=1 to M do
    Begin
      ReadLn(a,b);
      Include(Tasks[a].Before,b);
    end;
end;

Begin
  ReadLn(N,M);
  While (N <> 0) or (M <> 0) do
    Begin
      Init;
      for i:=1 to N do
        Begin
          T:=[i];
          L:=[];
          Repeat
            S:=T;
            T:=[];
            for j:=1 to N do
              if j in S then
                Begin
                  T:=T+Tasks[j].Before;
                  L:=L+Tasks[j].Before;
                end;
          Until T = [];
          R[i]:=L;
        end;
      for i:=1 to N do
        Tasks[i].Before:=R[i];
      for i:=1 to N-1 do
        for j:=i+1 to N do
          if Tasks[i].Number in Tasks[j].Before then
            Begin
              Change:=Tasks[i];
              Tasks[i]:=Tasks[j];
              Tasks[j]:=Change;
            end;
      for i:=1 to N-1 do
        Write(Tasks[i].Number,' ');
      WriteLn(Tasks[N].Number);
      ReadLn(N,M);
    end;
end.