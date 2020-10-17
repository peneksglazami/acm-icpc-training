{Problem: 836 - Largest Submatrix
 Author: Fernando Silva
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem836 (input,output);
Const
  MaxN = 25;

Var
  a: Array [1..MaxN,1..MaxN] of Byte;
  t: Array [0..MaxN,0..MaxN] of Byte;
  i,j,g,N,Test,min,max: Integer;
  St: String;
  Ch: Char;

Procedure Trim(Var St: String);
Begin
  if St = '' then
    Exit;
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      FillChar(t,SizeOf(t),0);
      ReadLn;
      ReadLn(St);
      Trim(St);
      N:=Length(St);
      for i:=1 to N do
        if St[i] = '0' then
          a[1,i]:=0
        else
          a[1,i]:=1;
      for i:=2 to N do
        Begin
          for j:=1 to N do
            Begin
              Read(Ch);
              if Ch = '0' then
                a[i,j]:=0
              else
                a[i,j]:=1;
            end;
          ReadLn;
        end;
      max:=0;
      for i:=1 to N do
        for j:=1 to N do
          if a[i,j] = 0 then
            t[i,j]:=0
          else
            t[i,j]:=t[i-1,j]+1;
      max:=0;
      for i:=1 to N do
        for j:=1 to N do
          Begin
            min:=t[i,j];
            for g:=j to N do
              Begin
                if min > t[i,g] then
                  min:=t[i,g];
                if min = 0 then
                  Break;
                if max < min*(g-j+1) then
                  max:=min*(g-j+1);
              end;
          end;
      WriteLn(max);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.