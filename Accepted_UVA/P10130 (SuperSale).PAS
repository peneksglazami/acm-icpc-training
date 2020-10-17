{Problem: 10130 - SuperSale
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
Program Problem10130 (input,output);
Var
  P: Array [1..1000] of Byte;
  W: Array [1..1000] of Byte;
  Old,NewA: Array [0..30] of LongInt; {0 - пустого места нет}
  i,j,k,x,y,Test,N,G,MW: Integer;
  MaxValue: LongInt;

Begin
  ReadLn(Test);
  for x:=1 to Test do
    Begin
      ReadLn(N);
      for i:=1 to N do
        ReadLn(P[i],W[i]);
      ReadLn(G);
      MaxValue:=0;
      for y:=1 to G do
        Begin
          ReadLn(MW);
          FillChar(Old,SizeOf(Old),0);
          for k:=1 to N do
            for i:=0 to MW do {i - сколько кг. ещё можно взять}
              if (i >= W[k]) and (P[k]+Old[i] > Old[i-W[k]]) then
                Old[i-W[k]]:=P[k]+Old[i];
          Inc(MaxValue,Old[0]);
        end;
      WriteLn(MaxValue);
    end;
end.