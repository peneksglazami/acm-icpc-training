{Problem: 2487 - Lollies
 ACM ICPC - Oceania - South Pacific - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2487;
{$APPTYPE CONSOLE}
const
  MaxN = 100;
  INFINITY = -1;

var
  a: array [1..MaxN+1,1..MaxN+1] of Integer;
  l,d: array [1..MaxN] of Integer;
  b: array [1..MaxN+1] of Integer;
  V: Set of 1..MaxN+1;
  i,j,N,Er,max,imax: Integer;
  Title,St: String;

begin
  ReadLn(Title);
  while Title <> '#' do
    begin
      N:=0;
      ReadLn(St);
      while St[1] in ['0'..'9'] do
        begin
          Inc(N);
          Val(Copy(St,1,Pos(' ',St)-1),l[N],Er);
          Delete(St,1,Pos(' ',St));
          Val(St,d[N],Er);
          ReadLn(St);
        end;
      for i:=1 to N do
        for j:=1 to N do
          a[i,j]:=INFINITY;
      for i:=1 to N-1 do
        for j:=i+d[i] to N do
          a[j,i]:=l[i];
      for i:=1 to N do
        a[N+1,i]:=l[i];
      for i:=1 to N do
        b[i]:=INFINITY;
      b[N+1]:=0;
      for i:=N+1 downto 2 do
        for j:=i-1 downto 1 do
          if (a[i,j] <> INFINITY) and (b[i]+a[i,j] > b[j]) then
            b[j]:=b[i]+a[i,j];
      max:=INFINITY;
      for i:=N downto 1 do
        if b[i] > max then
          begin
            max:=b[i];
            imax:=i;
          end;
      Write('In ',Title,' ',max);
      if max = 1 then
        WriteLn(' lolly can be obtained:')
      else
        WriteLn(' lollies can be obtained:');
      while imax <> N+1 do
        begin
          Write('On day ',imax,' collect ',l[imax]);
          if l[imax] = 1 then
            WriteLn(' lolly.')
          else
            WriteLn(' lollies.');
          for i:=N+1 downto imax+1 do
            if (a[i,imax] <> INFINITY) and (b[imax] = b[i]+a[i,imax]) then
              begin
                imax:=i;
                break;
              end;
        end;
      Title:=St;
      if Title <> '#' then
        WriteLn;
    end;
end.