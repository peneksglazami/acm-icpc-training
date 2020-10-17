{Problem 325 - Identifying Legal Pascal Real Constants
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem325 (input, output);
Var
  St: String;
  i: Integer;

Function Correct(St: String): Boolean;
Type
  State = (S_S,S_A,S_B,S_C,S_D,S_E,S_F,S_G,S_Er);
Var
  S: State;
  i: Integer;
Begin
  St:=St+'$';
  i:=1;
  S:=S_S;
  Repeat
    Case S of
      S_S: if St[i] in ['+','-','0'..'9'] then
             Begin
               Inc(i);
               S:=S_A;
             end
           else
             S:=S_Er;
      S_A: if St[i] = '.' then
             Begin
               Inc(i);
               S:=S_C;
             end
           else
             if St[i] in ['e','E'] then
               Begin
                 Inc(i);
                 S:=S_E;
               end
             else
               if St[i] in ['0'..'9'] then
                 Inc(i)
               else
                 S:=S_Er;
      S_C: if St[i] in ['0'..'9'] then
             Begin
               Inc(i);
               S:=S_D;
             end
           else
             S:=S_Er;
      S_D: if St[i] in ['0'..'9'] then
             Inc(i)
           else
             if St[i] = '$' then
               S:=S_F
             else
               if St[i] in ['e','E'] then
                 Begin
                   Inc(i);
                   S:=S_E;
                 end
               else
                 S:=S_Er;
      S_E: if St[i] in ['+','-'] then
             Begin
               Inc(i);
               S:=S_B;
             end
           else
             if St[i] in ['0'..'9'] then
               Begin
                 Inc(i);
                 S:=S_G;
               end
             else
               S:=S_Er;
       S_B: if St[i] in ['0'..'9'] then
              Begin
                Inc(i);
                S:=S_G;
              end
            else
              S:=S_Er;
       S_G: if St[i] in ['0'..'9'] then
              Inc(i)
            else
              if St[i] = '$' then
                S:=S_F
              else
                S:=S_Er;
     end;
  Until (S = S_F) or (S = S_Er);
  Result:=(S = S_F) and (i = Length(St));
end;

Begin
  ReadLn(St);
  While St <> '*' do
    Begin
      St:=St+'$';
      i:=1;
      While (St[i] = ' ') and (i <= Length(St)) do
        Inc(i);
      Delete(St,1,i-1);
      St:='$'+St;
      i:=Length(St);
      While (St[i] = ' ') and (i >= 0) do
        Dec(i);
      Delete(St,i+1,Length(St)-i+1);
      Delete(St,1,1);
      Delete(St,Length(St),1);
      if Correct(St) then
        WriteLn(St,' is legal.')
      else
        WriteLn(St,' is illegal.');
      ReadLn(St);
    end;
end.