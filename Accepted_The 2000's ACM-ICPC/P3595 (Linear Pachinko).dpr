{Problem: 3595 - Linear Pachinko
 ACM ICPC - North America - Mid Central - 2006/2007
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3595;
{$APPTYPE CONSOLE}
var
  St: String;
  i,j,N,Sum: Integer;
  ok: Boolean;

procedure Trim(var St: String) ;
begin
  while St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

begin
  ReadLn(St);
  Trim(St);
  while St <> '#' do
    begin
      Sum:=0;
      N:=Length(St);
      for i:=1 to N do
        case St[i] of
          '.': Sum:=Sum+100;
          '/': begin
                 j:=i-1;
                 ok:=True;
                 while (j > 0) and ok do
                   begin
                     case St[j] of
                       '.': Break;
                       '|','\': begin
                                  ok:=False;
                                  Break;
                                end;
                     end;
                     dec(j);
                   end;
                 if ok then
                   Sum:=Sum+100;
               end;
          '\': begin
                 j:=i+1;
                 ok:=True;
                 while (j <= N) and ok do
                   begin
                     case St[j] of
                       '.': Break;
                       '|','/': begin
                                  ok:=False;
                                  Break;
                                end;
                     end;
                     inc(j);
                   end;
                 if ok then
                   Sum:=Sum+100;
               end;
          '|': begin
                 j:=i-1;
                 ok:=True;
                 while (j > 0) and ok do
                   begin
                     case St[j] of
                       '.': Break;
                       '|','\': begin
                                  ok:=False;
                                  Break;
                                end;
                     end;
                     dec(j);
                   end;
                 if ok then
                   Sum:=Sum+50;
                 j:=i+1;
                 ok:=True;
                 while (j <= N) and ok do
                   begin
                     case St[j] of
                       '.': Break;
                       '|','/': begin
                                  ok:=False;
                                  Break;
                                end;
                     end;
                     inc(j);
                   end;
                 if ok then
                   Sum:=Sum+50;
               end;
        end;
      WriteLn(Sum div N);
      ReadLn(St);
      Trim(St);
    end;
end.