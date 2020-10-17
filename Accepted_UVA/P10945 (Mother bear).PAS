{Problem: 10945 - Mother bear
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program P10945 (input,output);
Var
  St,S: String;
  i: Integer;

Begin
  ReadLn(St);
  While St <> 'DONE' do
    Begin
      i:=1;
      While True do
        Begin
          if not (St[i] in ['A'..'Z','a'..'z']) then
            Delete(St,i,1)
          else
            Inc(i);
          if Length(St) < i then
           Break;
        end;
      for i:=1 to Length(St) do
        St[i]:=UpCase(St[i]);
      s:='';
      for i:=1 to Length(St) do
        s:=st[i]+s;
      if S = St then
        WriteLn('You won''t be eaten!')
      else
        WriteLn('Uh oh..');
      ReadLn(St);
    end;
end.