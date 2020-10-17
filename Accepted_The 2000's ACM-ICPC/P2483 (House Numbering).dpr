{Problem: 2483 - House Numbering
 ACM ICPC - Oceania - South Pacific - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S+,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem2483 (input,output);
Var
  a,b,n,Er,res,n_set: Integer;
  St: String;

Begin
  n_set:=0;
  ReadLn(St);
  While St[1] <> '#' do
    Begin
      Inc(n_set);
      WriteLn('Set ',n_set);
      Delete(St,1,5);
      Val(Copy(St,1,Pos(' ',St)-1),a,Er);
      Delete(St,1,Pos(' ',St));
      Val(St,b,Er);
      ReadLn(St);
      While (St[1] <> 'C') and (St[1] <> '#') do
        Begin
          Val(St,n,Er);
          ReadLn(St);
          if n = 0 then
            res:=a
          else
            Begin
              res:=0;
              while n > 0 do
                Begin
                  if Odd(n) then
                    Inc(res,b)
                  else
                    Inc(res,a);
                  n:=n shr 1;
                end;
            end;
          WriteLn(res);
        end;
    end;
end.