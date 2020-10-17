{Problem: 2410 - IP Address Analysis
 ACM ICPC - North America - Rocky Mountain - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem2410;
Var
  prefix,suffix,N,Er: Integer;
  St,Bin: String;

Function ToBin(N: Integer): String;
Begin
  Result:='';
  While N > 0 do
    Begin
      if N mod 2 = 0 then
        Result:='0'+Result
      else
        Result:='1'+Result;
      N:=N shr 1;
    end;
  While Length(Result) < 8 do
    Result:='0'+Result;
end;

Function ToDec(St: String): Integer;
Var
  i: Integer;
Begin
  Result:=0;
  for i:=1 to Length(St) do
    Begin
      Result:=Result shl 1;
      if St[i] = '1' then
        Inc(Result);
    end;
end;

Function Right(N: Integer): String;
Begin
  Str(N,Result);
  While Length(Result) < 9 do
    Result:=' '+Result;
end;

Begin
  While not EOF do
    Begin
      ReadLn(St);
      Val(Copy(St,1,Pos('.',St)-1),N,Er);
      Delete(St,1,Pos('.',St));
      Bin:=ToBin(N);
      Val(Copy(St,1,Pos('.',St)-1),N,Er);
      Delete(St,1,Pos('.',St));
      Bin:=Bin+ToBin(N);
      Val(Copy(St,1,Pos('.',St)-1),N,Er);
      Delete(St,1,Pos('.',St));
      Bin:=Bin+ToBin(N);
      Val(St,N,Er);
      Bin:=Bin+ToBin(N);
      if Bin[1] = '0' then
        Begin
          prefix:=ToDec(Copy(Bin,2,7));
          suffix:=ToDec(Copy(Bin,9,24));
        end
      else
        if Copy(Bin,1,2) = '10' then
          Begin
            prefix:=ToDec(Copy(Bin,3,14));
            suffix:=ToDec(Copy(Bin,17,16));
          end
        else
          Begin
            prefix:=ToDec(Copy(Bin,4,21));
            suffix:=ToDec(Copy(Bin,25,8));
          end;
      WriteLn('prefix ='+Right(prefix)+'  suffix ='+Right(suffix));
    end;
end.