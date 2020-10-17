{Problem: 10681 - Teobaldo's Trip
 Problem setter: Sergio Queiroz de Medeiros
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10681 (input,output);
Const
  MaxC = 100;

Var
  a: Array [1..MaxC,1..MaxC] of Boolean;
  s1,s2: Array [0..MaxC] of Integer;
  mm: Set of 1..MaxC;
  i,j,g,x,y,C,L,S,E,D: Integer;

Begin
  ReadLn(C,L);
  While (C <> 0) or (L <> 0) do
    Begin
      FillChar(a,SizeOf(a),False);
      for i:=1 to L do
        Begin
          ReadLn(x,y);
          a[x,y]:=True;
          a[y,x]:=True;
        end;
      ReadLn(S,E,D);
      ReadLn;
      s1[0]:=1; s1[1]:=S; mm:=[S];
      for i:=1 to D do
        Begin
          s2:=s1;
          FillChar(s1,SizeOf(s1),0);
          mm:=[];
          for j:=1 to s2[0] do
            for g:=1 to C do
              if not (g in mm) and a[s2[j],g] then
                Begin
                  Inc(s1[0]);
                  s1[s1[0]]:=g;
                  mm:=mm+[g];
                end;
        end;
      if E in mm then
        WriteLn('Yes, Teobaldo can travel.')
      else
        WriteLn('No, Teobaldo can not travel.');
      ReadLn(C,L);
    end;
end.