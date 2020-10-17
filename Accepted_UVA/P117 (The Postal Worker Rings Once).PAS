{Problem: 117 - The Postal Worker Rings Once
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L+,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem117 (input,output);
Var
  a: Array ['a'..'z','a'..'z'] of Integer;
  d,dd: Array ['a'..'z'] of Integer;
  St: String;
  i,j,L,min: Integer;
  m1,m2,Ch,ChMin: Char;
  T: Set of 'a'..'z';

Procedure Trim(Var St: String);
Begin
  While St[1] = ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Begin
  While not EOF do
    Begin
      FillChar(d,SizeOf(d),0);
      for m1:='a' to 'z' do
        for m2:='a' to 'z' do
          a[m1,m2]:=MaxInt div 2;
      for m1:='a' to 'z' do
        a[m1,m1]:=0;
      L:=0;
      ReadLn(St);
      Trim(St);
      While St <> 'deadend' do
        Begin
          a[St[1],St[Length(St)]]:=Length(St);
          a[St[Length(St)],St[1]]:=Length(St);
          Inc(d[St[1]]);
          Inc(d[St[Length(St)]]);
          Inc(L,Length(St));
          ReadLn(St);
          Trim(St);
        end;
      m1:=' '; m2:=' ';
      for Ch:='a' to 'z' do
        if Odd(d[Ch]) then
          if m1 = ' ' then
            m1:=Ch
          else
            m2:=Ch;
      if m1 <> ' ' then
        Begin
          for Ch:='a' to 'z' do
            dd[Ch]:=a[m1,Ch];
          T:=['a'..'z']-[m1];
          While T <> [] do
            Begin
              min:=MaxInt;
              for Ch:='a' to 'z' do
                if (Ch in T) and (min > dd[Ch]) then
                  Begin
                    min:=dd[Ch];
                    ChMin:=Ch;
                  end;
              T:=T-[ChMin];
              for Ch:='a' to 'z' do
                if dd[Ch] > dd[ChMin]+a[ChMin,Ch] then
                  dd[Ch]:=dd[ChMin]+a[ChMin,Ch];
            end;
          Inc(L,dd[m2]);
        end;
      WriteLn(L);
    end;
end.