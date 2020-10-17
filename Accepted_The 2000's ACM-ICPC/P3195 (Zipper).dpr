{Problem: 3195 - Zipper
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program Problem3195;
{$APPTYPE CONSOLE}
const
  maxl = 400;

var
  t: array [0..maxl,0..maxl] of boolean;
  i,j,n,test,lena,lenb,lenc: Integer;
  a,b,c,St: String;

function max(a,b: Integer): Integer;
begin
  if a > b then
    max:=a
  else
    max:=b;
end;

function NextToken(var St: String): String;
begin
  Result:=Copy(St,1,Pos(' ',St)-1);
  Delete(St,1,Pos(' ',St));
end;

begin
  ReadLn(test);
  for i:=1 to test do
    begin
      ReadLn(St);
      St:=St+' ';
      a:=NextToken(St);
      b:=NextToken(St);
      c:=NextToken(St);
      lena:=Length(a);
      lenb:=Length(b);
      lenc:=Length(c);
      FillChar(t,SizeOf(t),false);
      t[0,0]:=true;
      for j:=1 to lena do
        t[j,0]:=t[j-1,0] and (a[j] = c[j]);
      for j:=1 to lenb do
        t[0,j]:=t[0,j-1] and (b[j] = c[j]);
      for n:=2 to lenc do
        for j:=1 to n-1 do
          if ((j <= lena) and (n-j <= lenb)) then
            t[j,n-j]:=((a[j] = c[n]) and t[j-1,n-j])
                   or ((b[n-j] = c[n]) and t[j,n-j-1]);
      Write('Data set ',i,': ');
      if t[lena,lenb] then
        WriteLn('yes')
      else
        WriteLn('no');
    end;
end.