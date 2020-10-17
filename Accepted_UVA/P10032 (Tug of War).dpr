{Problem: 10032 - Tug of War
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem10032 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxW = 450;
  MaxN = 100;

Var
  w: Array [1..MaxN] of Integer;
  t: Array [0..MaxN div 2,0..(MaxN*MaxW)] of Boolean;
  s: Array [1..(MaxN*MaxN*MaxW) div 4] of Record cnt: Byte; w: Word; end;
  i,j,N,Test,ss,mm,Sum,s1,s2: Integer;

Begin
  {Reset(Input,'input.txt');
  ReWrite(Output,'output.txt');}
  ReadLn(Test);
  While Test > 0 do
    Begin
      ReadLn;
      ReadLn(N);
      for i:=1 to N do
        ReadLn(w[i]);
      Sum:=0;
      for i:=1 to N do
        Inc(Sum,w[i]);
      FillChar(t,SizeOf(t),False);
      t[0,0]:=True;
      ss:=1;
      s[1].cnt:=0;
      s[1].w:=0;
      for i:=1 to N do
        Begin
          mm:=ss;
          for j:=1 to mm do
            if (s[j].cnt < N div 2) then
              if not t[s[j].cnt+1,s[j].w+w[i]] then
                Begin
                  t[s[j].cnt+1,s[j].w+w[i]]:=True;
                  Inc(ss);
                  s[ss].cnt:=s[j].cnt+1;
                  s[ss].w:=s[j].w+w[i];
                end;
        end;
      s1:=Sum;
      s2:=0;
      for i:=Sum downto 0 do
        if t[N div 2,i] then
          if Abs(s1-s2) > Abs(Sum-2*i) then
            Begin
              s1:=i;
              s2:=Sum-s1;
            end;
      if s1 < s2 then
        WriteLn(s1,' ',s2)
      else
        WriteLn(s2,' ',s1);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
  {CloseFile(Input);
  CloseFile(Output);}
end.
