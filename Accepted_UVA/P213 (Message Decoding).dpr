{Problem: 213 - Message Decoding
 ACM ICPC World Finals - 1991 - Problem F
 Solved by Andrey Grigorov}

{$A8,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem213 (input, output);
Var
  m: Array [1..7] of Integer;
  ABC,St,Decode: String;
  i,j,K: Integer;
  Done: Boolean;

Function ReadNext(k: Integer): String;
Var
  i: Integer;
  Ch: Char;
Begin
  Result:='';
  for i:=1 to k do
    Begin
      if EOLn then
        ReadLn;
      Read(Ch);
      Result:=Result+Ch;
    end;
end;

Function AllOnes(St: String): Boolean;
Var
  i: Integer;
Begin
  Result:=True;
  for i:=1 to Length(St) do
    Result:=Result and (St[i] = '1');
end;

Function BinToDec(St: String): Integer;
Var
  i,j,Res: Integer;
Begin
  Res:=0;
  i:=1;
  for j:=Length(St) downto 1 do
    Begin
      if St[j] = '1' then
        Res:=Res+i;
      i:=i*2;
    end;
  BinToDec:=Res;
end;

Begin
  m[1]:=1;
  j:=2;
  for i:=2 to 7 do
    Begin
      m[i]:=m[i-1]+j-1;
      j:=j*2;
    end;
  While not EOF do
    Begin
      ReadLn(ABC);
      Done:=False;
      Decode:='';
      Repeat
        K:=BinToDec(ReadNext(3));
        if K > 0 then
          Begin
            St:=ReadNext(K);
            While not AllOnes(St) do
              Begin
                Decode:=Decode+ABC[BinToDec(St)+m[K]];
                St:=ReadNext(K);
              end;
          end
        else
          Done:=True;
      Until Done;
      WriteLn(Decode);
      ReadLn;
    end;
end.