{ACM ICPC 2005-2006 South Pacific Programming Contest
 Problem A - Dice
 Solved by Andrey Grigorov}

{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q+,R+,S+,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem3279 (input,output);
{$APPTYPE CONSOLE}
Var
  St,Name1,Name2: String;
  i,N,x,y,a: Integer;

Function Trim(St: String): String;
Begin
  While St[1] = ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
  Result:=St;
end;

Begin
  ReadLn(St);
  While Trim(St) <> '# # #' do
    Begin
      St:=Trim(St);
      Name1:=Copy(St,1,Pos(' ',St)-1);
      Delete(St,1,Pos(' ',St));
      St:=Trim(St);
      Name2:=Copy(St,1,Pos(' ',St)-1);
      Delete(St,1,Pos(' ',St));
      St:=Trim(St);
      ReadLn(N);
      x:=0;
      y:=0;
      for i:=1 to N do
        Begin
          Read(a);
          if St = 'odd' then
            if Odd(a) then
              Inc(y)
            else
              Inc(x)
          else
            if Odd(a) then
              Inc(x)
            else
              Inc(y);
        end;
      ReadLn;
      WriteLn(Name1,' ',x,' ',Name2,' ',y);
      ReadLn(St);
    end;
end.
