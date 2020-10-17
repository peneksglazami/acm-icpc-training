{Problem: 102 - Ecological Bin Packing
 Solution: Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem102 (input, output);
Const
  Color: Array [1..6] of String[3] = ('BCG','BGC','CBG','CGB','GBC','GCB');

Var
  B,G,C: Array [1..3] of LongInt;
  M: Array [1..6] of LongInt;
  Min: LongInt;
  i,j,NMin: Byte;

Begin
  While not EOF do
    Begin
      for i:=1 to 3 do
        Read(B[i],G[i],C[i]);
      ReadLn;
      M[1]:=B[2]+B[3]+C[1]+C[3]+G[1]+G[2];
      M[2]:=B[2]+B[3]+C[1]+C[2]+G[1]+G[3];
      M[3]:=B[1]+B[3]+C[2]+C[3]+G[1]+G[2];
      M[4]:=B[1]+B[2]+C[2]+C[3]+G[1]+G[3];
      M[5]:=B[1]+B[3]+C[1]+C[2]+G[2]+G[3];
      M[6]:=B[1]+B[2]+C[1]+C[3]+G[2]+G[3];
      Min:=MaxLongInt;
      for i:=1 to 6 do
        if M[i] < Min then
          Begin
            Min:=M[i];
            NMin:=i;
          end;
      WriteLn(Color[NMin],' ',M[NMin]);
    end;
end.