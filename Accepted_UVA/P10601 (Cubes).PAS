{Problem: 10601 - Cubes
 Problem source: Bulgarian National Olympiad in Inforamtics 2003
 Problem submetter: Ivaylo Riskov
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10601 (input,output);
Var
  b: Array [1..6] of Integer;
  i,j,aa,N,Test: Integer;
  St,S: String;

Function Res(St: String): LongInt;
Begin
  if St = '12 0 0 0 0 0' then
    Res:=1;
  if St = '11 1 0 0 0 0' then
    Res:=1;
  if St = '10 2 0 0 0 0' then
    Res:=5;
  if St = '10 1 1 0 0 0' then
    Res:=6;
  if St = '9 3 0 0 0 0' then
    Res:=13;
  if St = '9 2 1 0 0 0' then
    Res:=30;
  if St = '9 1 1 1 0 0' then
    Res:=55;
  if St = '8 4 0 0 0 0' then
    Res:=27;
  if St = '8 3 1 0 0 0' then
    Res:=85;
  if St = '8 2 2 0 0 0' then
    Res:=135;
  if St = '8 2 1 1 0 0' then
    Res:=250;
  if St = '8 1 1 1 1 0' then
    Res:=495;
  if St = '7 5 0 0 0 0' then
    Res:=38;
  if St = '7 4 1 0 0 0' then
    Res:=170;
  if St = '7 3 2 0 0 0' then
    Res:=340;
  if St = '7 3 1 1 0 0' then
    Res:=660;
  if St = '7 2 2 1 0 0' then
    Res:=1000;
  if St = '7 2 1 1 1 0' then
    Res:=1980;
  if St = '7 1 1 1 1 1' then
    Res:=3960;
  if St = '6 6 0 0 0 0' then
    Res:=48;
  if St = '6 5 1 0 0 0' then
    Res:=236;
  if St = '6 4 2 0 0 0' then
    Res:=600;
  if St = '6 4 1 1 0 0' then
    Res:=1160;
  if St = '6 3 3 0 0 0' then
    Res:=784;
  if St = '6 3 2 1 0 0' then
    Res:=2320;
  if St = '6 3 1 1 1 0' then
    Res:=4620;
  if St = '6 2 2 2 0 0' then
    Res:=3510;
  if St = '6 2 2 1 1 0' then
    Res:=6940;
  if St = '6 2 1 1 1 1' then
    Res:=13860;
  if St = '5 5 2 0 0 0' then
    Res:=708;
  if St = '5 5 1 1 0 0' then
    Res:=1386;
  if St = '5 4 3 0 0 0' then
    Res:=1170;
  if St = '5 4 2 1 0 0' then
    Res:=3480;
  if St = '5 4 1 1 1 0' then
    Res:=6930;
  if St = '5 3 3 1 0 0' then
    Res:=4620;
  if St = '5 3 2 2 0 0' then
    Res:=6960;
  if St = '5 3 2 1 1 0' then
    Res:=13860;
  if St = '5 3 1 1 1 1' then
    Res:=27720;
  if St = '5 2 2 2 1 0' then
    Res:=20820;
  if St = '5 2 2 1 1 1' then
    Res:=41580;
  if St = '4 4 4 0 0 0' then
    Res:=1479;
  if St = '4 4 3 1 0 0' then
    Res:=5790;
  if St = '4 4 2 2 0 0' then
    Res:=8730;
  if St = '4 4 2 1 1 0' then
    Res:=17340;
  if St = '4 4 1 1 1 1' then
    Res:=34650;
  if St = '4 3 3 2 0 0' then
    Res:=11580;
  if St = '4 3 3 1 1 0' then
    Res:=23100;
  if St = '4 3 2 2 1 0' then
    Res:=34680;
  if St = '4 3 2 1 1 1' then
    Res:=69300;
  if St = '4 2 2 2 2 0' then
    Res:=52110;
  if St = '4 2 2 2 1 1' then
    Res:=103980;
  if St = '3 3 3 3 0 0' then
    Res:=15408;
  if St = '3 3 3 2 1 0' then
    Res:=46200;
  if St = '3 3 3 1 1 1' then
    Res:=92400;
  if St = '3 3 2 2 2 0' then
    Res:=69360;
  if St = '3 3 2 2 1 1' then
    Res:=138600;
  if St = '3 2 2 2 2 1' then
    Res:=207960;
  if St = '2 2 2 2 2 2' then
    Res:=312120;
end;

Begin
  ReadLn(Test);
  While Test > 0 do
    Begin
      FillChar(b,SizeOf(b),0);
      for i:=1 to 12 do
        Begin
          Read(aa);
          Inc(b[aa]);
        end;
      ReadLn;
      i:=1;
      for i:=1 to 5 do
        for j:=i+1 to 6 do
          if b[i] < b[j] then
            Begin
              aa:=b[i];
              b[i]:=b[j];
              b[j]:=aa;
            end;
      N:=1;
      While (b[N] > 0) and (N < 6) do
        Inc(N);
      if B[N] = 0 then
        Dec(N);
      St:='';
      for i:=1 to 5 do
        Begin
          Str(b[i],S);
          St:=St+S+' ';
        end;
      Str(b[6],S);
      St:=St+S;
      WriteLn(Res(St));
      Dec(Test);
    end;
end.