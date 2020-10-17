{Problem: 2243 - Channel Allocation
 ACM ICPC - Africa and Middle East - South Africa - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}
Program Problem2243 (input,output);
Var
  a: Array [1..26,1..26] of Boolean;
  b: Array [1..26] of Set of 1..26;
  i,j,N,Color: Integer;
  Find: Boolean;
  St: String;

Procedure Hrom(i: Integer);
Var
  j,g: Integer;
  bb: Set of 1..26;
Begin
  if i = N+1 then
    Find:=True
  else
    Begin
      if b[i] = [] then
        Exit;
      for j:=1 to Color do
        if j in b[i] then
          Begin
            bb:=[];
            for g:=i+1 to N do
              if a[i,g] and (j in b[g]) then
                Begin
                  b[g]:=b[g]-[j];
                  bb:=bb+[g];
                end;
            Hrom(i+1);
            for g:=i+1 to N do
              if g in bb then
                b[g]:=b[g]+[j];
          end;
    end;
end;

Procedure Trim(Var St: String);
Begin
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Begin
  ReadLn(N);
  While N <> 0 do
    Begin
      FillChar(a,SizeOf(a),False);
      for i:=1 to N do
        Begin
          ReadLn(St);
          Trim(St);
          Delete(St,1,2);
          for j:=1 to Length(St) do
            Begin
              a[i,Ord(St[j])-Ord('A')+1]:=True;
              a[Ord(St[j])-Ord('A')+1,i]:=True;
            end;
        end;
      Color:=0;
      Repeat
        Inc(Color);
        Find:=False;
        for i:=1 to N do
          b[i]:=[1..Color];
        Hrom(1);
      Until Find;
      if Color = 1 then
        WriteLn(Color,' channel needed.')
      else
        WriteLn(Color,' channels needed.');
      ReadLn(N);
    end;
end.