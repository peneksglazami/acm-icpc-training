{Problem: 120 - Stacks of Flapjacks
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem120 (input,output);
Var
  a: Array [1..30] of Integer;
  i,max,n,k:Integer;

Procedure Flip(i: Integer);
Var
  j,buf: Integer;
Begin
  for j:=i to i+((n-i+1) div 2)-1 do
    Begin
      buf:=a[j];
      a[j]:=a[n-j+i];
      a[n-j+i]:=buf;
    end;
end;

Begin
  While not EOF do
    Begin
      n:=0;
      While not EOLn do
        Begin
          Inc(n);
          Read(a[n]);
          Write(a[n]);
          if not EOLn then
            Write(' ')
          else
            WriteLn;
        end;
      ReadLn;
      k:=0;
      if n > 0 then
        Flip(1);
      While k < n-1 do
        Begin
          max:=k+1;
          for i:=k+2 to n do
            if a[i] > a[max] then
              max:=i;
          if max <> k+1 then
            Begin
              if max <> n then
                Begin
                  Write(max,' ');
                  Flip(max);
                end;
              Write(k+1,' ');
              Flip(k+1);
            end;
          Inc(k);
        end;
      WriteLn('0');
    end;
end.