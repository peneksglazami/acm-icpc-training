Program Problem105 (input,output);
Var
  SkyLine: Array [1..10000] of Integer;
  i,j,L,H,R,MaxR,MinL: Integer;
Begin
  MinL:=10000;
  MaxR:=0;
  FillChar(SkyLine,SizeOf(SkyLine),0);
  While not EOF(input) do
    Begin
      ReadLn(L,H,R);
      if (R > MaxR) then
        MaxR:=R;
      if (L < MinL) then
        MinL:=L;
      for i:=L to R-1 do
        if (H > SkyLine[i]) then
          SkyLine[i]:=H;
    end;
  i:=MinL;
  Write(i,' ');
  While i <= MaxR-1 do
    Begin
      While (SkyLine[i+1] = SkyLine[i]) and (i <= MaxR-1) do
        Begin
          Inc(i);
        end;
      Inc(i);
      Write(SkyLine[i-1],' ',i,' ');
    end;
  WriteLn('0');
end.