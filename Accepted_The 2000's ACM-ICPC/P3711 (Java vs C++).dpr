{Problem: 3711 - Java vs C++
 ACM ICPC - Europe - Northeastern Europe & Russian Republic - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3711;
{$APPTYPE CONSOLE}
var
  St: String;

function IsCPP(St: String): Boolean;
var
  i: Integer;
begin
  Result:=False;
  if St[1] = '_' then Exit;
  for i:=1 to Length(St) do
    if not (St[i] in ['a'..'z','_']) then
      Exit
    else
      if St[i] = '_' then
        if i = Length(St) then
          Exit
        else
          if St[i+1] = '_' then
            Exit;
  Result:=True;
end;

function IsJava(St: String): Boolean;
var
  i: Integer;
begin
  Result:=False;
  if not (St[1] in ['a'..'z']) then Exit;
  for i:=2 to Length(St) do
    if not (St[i] in ['a'..'z','A'..'Z']) then
      Exit;
  Result:=True;
end;

function CPPToJava(St: String): String;
var
  i: Integer;
  capital: Boolean;
begin
  Result:='';
  capital:=False;
  for i:=1 to Length(St) do
    if St[i] = '_' then
      capital:=True
    else
      begin
        if capital then
          Result:=Result+Chr(Ord('A')+Ord(St[i])-Ord('a'))
        else
          Result:=Result+St[i];
        capital:=False;
      end;
end;

function JavaToCPP(St: String): String;
var
  i: Integer;
begin
  Result:='';
  for i:=1 to Length(St) do
    if St[i] in ['A'..'Z'] then
      Result:=Result+'_'+Chr(Ord('a')+Ord(St[i])-Ord('A'))
    else
      Result:=Result+St[i];
end;

begin
  while not EOF do
    begin
      ReadLn(St);
      if IsCPP(St) then
        WriteLn(CPPToJava(St))
      else
        if IsJava(St) then
          WriteLn(JavaToCPP(St))
        else
          WriteLn('Error!');
    end;
end.