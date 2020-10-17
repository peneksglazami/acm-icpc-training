{Problem: 2692 - Folding
 ACM ICPC - Europe - Northeastern - 2002/2003
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2692;
{$APPTYPE CONSOLE}
var
  t,f,l: array [1..100,1..100] of Byte;
  St: String;
  i,j: Integer;

function folding(i,j,k: Integer): Boolean;
var
  s: String;
begin
  Result:=False;
  s:=Copy(St,i,k);
  inc(i,k);
  while i <= j do
    begin
      if s <> Copy(St,i,k) then
        Exit;
      inc(i,k);
    end;
  Result:=True;
end;

function fold(i,j: Integer): Integer;
var
  s: String;
  k,len: Integer;
begin
  if t[i,j] = 0 then
    begin
      len:=j-i+1;
      t[i,j]:=len;
      f[i,j]:=0;
      for k:=i to j-1 do
        if t[i,j] > fold(i,k)+fold(k+1,j) then
          begin
            t[i,j]:=fold(i,k)+fold(k+1,j);
            f[i,j]:=2;
            l[i,j]:=k;
          end;
      for k:=1 to len div 2 do
        if (len mod k = 0) and folding(i,j,k) then
          begin
            Str(len div k,s);
            if t[i,j] > 2+Length(s)+fold(i,i+k-1) then
              begin
                t[i,j]:=2+Length(s)+fold(i,i+k-1);
                f[i,j]:=1;
                l[i,j]:=k;
              end;
          end;
    end;
  fold:=t[i,j];
end;

function res(i,j: Integer): String;
var
  s: String;
begin
  case f[i,j] of
    0: res:=Copy(St,i,j-i+1);
    1: begin
         Str(l[i,j],s);
         res:=s+'('+res(i,i+l[i,j]-1)+')';
       end;
    2: res:=res(i,l[i,j])+res(l[i,j]+1,j);
  end;
end;

begin
  while not EOF do
    begin
      ReadLn(St);
      for i:=1 to Length(St)-1 do
        for j:=i+1 to Length(St) do
          t[i,j]:=0;
      for i:=1 to Length(St) do
        t[i,i]:=1;
      fold(1,Length(St));
      WriteLn(res(1,Length(St)));
    end;
end.