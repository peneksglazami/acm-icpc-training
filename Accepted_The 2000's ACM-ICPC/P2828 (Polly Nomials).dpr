{Problem: 2828 - Polly Nomials
 ACM ICPC - North America - East Central - 2003/2004
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}

program Problem2828;
{$APPTYPE CONSOLE}
type
  Polynomial = record
    a: array [0..100] of Integer;
    deg: Integer;
  end;

var
  i,N,X,n_case: Integer;
  pol: Polynomial;

function Res(pol: Polynomial; X: Integer): Integer;
var
  i,xx: Integer;
begin
  Result:=pol.a[0];
  xx:=X;
  for i:=1 to pol.deg do
    begin
      Inc(Result,pol.a[i]*xx);
      xx:=xx*X;
    end;
end;

function len(n: Integer): Integer;
var
  St: String;
begin
  Str(n,St);
  Result:=Length(St);
end;

function GCD(a,b: Integer): Integer;
var
  nd: Integer;
begin
  nd:=b;
  while a > 0 do
    begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

procedure Cut(var pol: Polynomial; var deg,coef: Integer);
var
  i: Integer;
begin
  deg:=1;
  while (deg < pol.deg) and (pol.a[deg] = 0) do
    Inc(deg);
  for i:=deg to pol.deg do
    pol.a[i-deg]:=pol.a[i];
  Dec(pol.deg,deg);
  coef:=pol.a[0];
  for i:=1 to pol.deg do
    coef:=GCD(coef,pol.a[i]);
  for i:=1 to pol.deg do
    pol.a[i]:=pol.a[i] div coef;
end;

function PDA(pol: Polynomial): Integer;
var
  deg,coef,sum: Integer;
begin
  Result:=0;
  if pol.deg = 0 then
    Exit;
  if pol.a[0] <> 0 then
    Result:=len(pol.a[0])+1;
  Cut(pol,deg,coef);
  Inc(Result,PDA(pol)+2*deg);
  if coef > 1 then
    Inc(Result,len(coef)+1);
end;

begin
  Read(N);
  while N > 0 do
    begin
      FillChar(Pol,SizeOf(Pol),0);
      pol.deg:=N;
      for i:=N downto 0 do
        Read(pol.a[i]);
      ReadLn(X);
      Inc(n_case);
      WriteLn('Polynomial ',n_case,': ',Res(Pol,X),' ',PDA(pol));
      Read(N);
    end;
end.