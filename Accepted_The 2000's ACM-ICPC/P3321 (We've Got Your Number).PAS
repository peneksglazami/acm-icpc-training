{Problem: 3321 - We've Got Your Number
 ACM ICPC - North America - Southeast - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}
Program Problem3321(input,output);
Var
  St,NewSt,S: String;
  i,N: Integer;
  Ch: Char;

Procedure Trim(Var St: String);
Begin
  While St[1] = ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Begin
  ReadLn(St);
  ReadLn(N);
  While N > 0 do
    Begin
      Trim(St);
      Write('Description ',N,' of ');
      WriteLn(St,':');
      While N > 0 do
        Begin
          NewSt:='';
          While St <> '' do
            Begin
              i:=0;
              Ch:=St[1];
              While (St <> '') and (St[1] = Ch) do
                Begin
                  Delete(St,1,1);
                  Inc(i);
                end;
              While i > 0 do
                Begin
                  if i <= 9 then
                    Begin
                      Str(i,S);
                      i:=0;
                    end
                  else
                    Begin
                      S:='9';
                      Dec(i,9);
                    end;
                  NewSt:=NewSt+S+Ch;
                end;
            end;
          St:=NewSt;
          Dec(N);
        end;
      While Length(St) > 0 do
        Begin
          if Length(St) <= 60 then
            Begin
              WriteLn(St);
              St:='';
            end
          else
            Begin
              WriteLn(Copy(St,1,60));
              Delete(St,1,60);
            end;
        end;
      ReadLn(St);
      ReadLn(N);
    end;
end.