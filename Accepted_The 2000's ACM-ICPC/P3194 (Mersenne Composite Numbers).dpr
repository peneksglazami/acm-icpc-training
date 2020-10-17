{Problem: 3194 - Mersenne Composite Numbers
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3194;
{$APPTYPE CONSOLE}
const
  result: array [1..9] of String = (
    '23 * 89 = 2047 = ( 2 ^ 11 ) - 1',
    '47 * 178481 = 8388607 = ( 2 ^ 23 ) - 1',
    '233 * 1103 * 2089 = 536870911 = ( 2 ^ 29 ) - 1',
    '223 * 616318177 = 137438953471 = ( 2 ^ 37 ) - 1',
    '13367 * 164511353 = 2199023255551 = ( 2 ^ 41 ) - 1',
    '431 * 9719 * 2099863 = 8796093022207 = ( 2 ^ 43 ) - 1',
    '2351 * 4513 * 13264529 = 140737488355327 = ( 2 ^ 47 ) - 1',
    '6361 * 69431 * 20394401 = 9007199254740991 = ( 2 ^ 53 ) - 1',
    '179951 * 3203431780337 = 576460752303423487 = ( 2 ^ 59 ) - 1');
  deg: array [1..9] of Integer = (11,23,29,37,41,43,47,53,59);

var
  i,test,n: Integer;

begin
  ReadLn(test);
  while test > 0 do
    begin
      ReadLn(n);
      i:=1;
      while (deg[i] <= n) and (i <= 9) do
        begin
          WriteLn(result[i]);
          Inc(i);
        end;
      Dec(test);
      if test > 0 then
        WriteLn;
    end;
end.