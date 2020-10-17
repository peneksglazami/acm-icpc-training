{Problem: 2122 - Recognizing S Expressions
 ACM ICPC - North America - North Central - 2000/2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2122;
{$APPTYPE CONSOLE}
const
  ABC: Set of Char = ['A'..'Z','a'..'z','(',')',','];
  
var
  St,S: String;
  n_case,n: Integer;

procedure DeleteBlank(var St: String);
begin
  while Pos(' ',St) <> 0 do
    Delete(St,Pos(' ',St),1);
end;

function Trim(St: String): String;
begin
  while St[1] = ' ' do
    Delete(St,1,1);
  while St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
  Result:=St;
end;

function ABCCorrect(St: String): Boolean;
var
  i: Integer;
begin
  Result:=False;
  for i:=1 to Length(St) do
    if not (St[i] in ABC) then
      Exit;
  Result:=True;
end;

function CorrectBrackets(St: String): Boolean;
var
  i,br: Integer;
begin
  Result:=False;
  br:=0;
  for i:=1 to Length(St) do
    if St[i] = '(' then
      inc(br)
    else
      if St[i] = ')' then
        begin
          dec(br);
          if br < 0 then
            Exit;
        end;
  Result:=br = 0;
end;

function Correct(St: String): Boolean;
var
  i,j,br: Integer;
  S: String;
  Ok: Boolean;
begin
  Result:=False;
  if St = '' then
    Exit;
  if not CorrectBrackets(St) then
    Exit;
  if St[1] = '(' then
    if St[Length(St)] = ')' then
      begin
        for i:=2 to Length(St)-1 do
          if St[i] = ',' then
            if Correct(Copy(St,2,i-2)) and Correct(Copy(St,i+1,Length(St)-i-1)) then
              begin
                Result:=True;
                Exit;
              end;
        Exit;
      end
    else
      Exit;
  if (Length(St) <> 1) or not (St[1] in ['A'..'Z','a'..'z']) then
    Exit;
  Result:=True;
end;

begin
  n_case:=0;
  ReadLn(St);
  S:=St;
  DeleteBlank(St);
  while St <> '' do
    begin
      inc(n_case);
      WriteLn(n_case,': '+Trim(S));
      n:=n_case;
      while n >= 10 do
        begin
          Write(' ');
          n:=n div 10;
        end;
      if ABCCorrect(St) and
        (((Length(St) = 1) and (St[1] in ['A'..'Z','a'..'z'])) or
        ((Length(St) > 1) and (St[1] = '(') and (St[Length(St)] = ')') and Correct(St))) then
        WriteLn('   is an s-expression.')
      else
        WriteLn('   is not an s-expression.');
      ReadLn(St);
      S:=St;
      DeleteBlank(St);
      if St <> '' then
        WriteLn;
    end;
end.