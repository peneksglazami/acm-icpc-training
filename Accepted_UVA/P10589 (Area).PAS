{Problem: 10589 - Area
 Problemsetter: Shahriar Manzoor
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10589 (input,output);
Var
  i,a,N,M: LongInt;
  S,SqrA,x,y: Extended;

Function Dist2(x1,y1,x2,y2: Extended): Extended;
Begin
  Dist2:=Sqr(x2-x1)+Sqr(y2-y1);
end;

Function InSquare(x,y: Extended): Boolean;
Begin
  InSquare:=(Dist2(x,y,0,0) <= SqrA) and (Dist2(x,y,0,a) <= SqrA)
        and (Dist2(x,y,a,0) <= SqrA) and (Dist2(x,y,a,a) <= SqrA);

end;

Begin
  ReadLn(N,a);
  While (N <> 0) or (a <> 0) do
    Begin
      SqrA:=Sqr(a);
      M:=0;
      for i:=1 to N do
        Begin
          ReadLn(x,y);
          if InSquare(x,y) then
            Inc(M);
        end;
      WriteLn((SqrA*M)/N:0:5);
      ReadLn(N,a);
    end;
end.