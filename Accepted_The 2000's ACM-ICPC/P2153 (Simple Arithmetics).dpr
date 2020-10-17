{Problem: 2153 - Simple Arithmetics
 ACM ICPC - Europe - Central - 2000/2001
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2153;
{$APPTYPE CONSOLE}
const
  Osn = 10;
  MaxL = 1000;

type
  TLong = array [0..MaxL] of Integer;

var
  Res: array [1..505] of String;
  A,B,C: TLong;
  i,max,Test: Integer;
  St: String;

procedure StrToLong(St: String; var A: TLong);
var
  i,j: Integer;
begin
  FillChar(A,SizeOf(A),0);
  for i:=1 to Length(St) do
    begin
      for j:=A[0] downto 1 do
        begin
          A[j+1]:=A[j+1]+(10*A[j]) div Osn;
          A[j]:=(10*A[j]) mod Osn;
        end;
      A[1]:=A[1]+Ord(St[i])-Ord('0');
      if A[A[0]+1] > 0 then
        inc(A[0]);  
    end;
end;

procedure Sum(const A,B: TLong; var C: TLong);
var
  i,N: Integer;
begin
  FillChar(C,SizeOf(C),0);
  if A[0] > B[0] then
    N:=A[0]
  else
    N:=B[0];
  for i:=1 to N do
    begin
      C[i+1]:=(A[i]+B[i]+C[i]) div Osn;
      C[i]:=(A[i]+B[i]+C[i]) mod Osn;
    end;
  if C[N+1] > 0 then
    C[0]:=N+1
  else
    C[0]:=N;     
end;

procedure Sub(var A: TLong; const B: TLong);
var
  i,j: Integer;
begin
  for i:=1 to B[0] do
    begin
      dec(A[i],B[i]);
      j:=i;
      while A[j] < 0 do
        begin
          inc(A[j],Osn);
          dec(A[j+1]);
          inc(j);
        end;
    end;
  i:=A[0];
  while (i > 1) and (A[i] = 0) do
    dec(i);
  A[0]:=i;
end;

function LongToStr(const A: TLong): String;
var
  i,N: Integer;
  S: String;
begin
  Str(Osn,S);
  N:=Length(S)-1;
  Str(A[A[0]],Result);
  for i:=A[0]-1 downto 1 do
    begin
      Str(A[i],S);
      while Length(S) < N do
        S:='0'+S;
      Result:=Result+S;
    end;
end;

procedure Mult(const A: TLong; X: Integer; var C: TLong);
var
  i: Integer;
begin
  FillChar(C,SizeOf(C),0);
  if X = 0 then
    C[0]:=1
  else
    begin
      for i:=1 to A[0] do
        begin
          C[i+1]:=(A[i]*X+C[i]) div Osn;
          C[i]:=(A[i]*X+C[i]) mod Osn;
        end;
      if C[A[0]+1] > 0 then
        C[0]:=A[0]+1
      else
        C[0]:=A[0];
    end;
end;

procedure MultLong(const A,B: TLong; var C: TLong);
var
  i,j: Integer;
  D,E: TLong;
begin
  FillChar(C,SizeOf(C),0);
  C[1]:=0;
  if ((A[0] = 1) and (A[1] = 0)) or
     ((B[0] = 1) and (B[1] = 0)) then
     Exit;
  for i:=1 to B[0] do
    begin
      Mult(A,B[i],D);
      for j:=D[0] downto 1 do
        D[j+i-1]:=D[j];
      for j:=i-1 downto 1 do
        D[j]:=0;
      D[0]:=D[0]+i-1;
      Sum(C,D,E);
      C:=E;
    end;
end;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn(St);
      i:=1;
      while St[i] in ['0'..'9'] do
        inc(i);
      StrToLong(Copy(St,1,i-1),A);
      StrToLong(Copy(St,i+1,Length(St)-i),B);
      case St[i] of
        '+': begin
               Sum(A,B,C);
               Res[1]:=LongToStr(A);
               Res[2]:='+'+LongToStr(B);
               Res[3]:='';
               Res[4]:=LongToStr(C);
               max:=0;
               for i:=1 to 4 do
                 if Length(Res[i]) > max then
                   max:=Length(Res[i]);
               for i:=1 to 4 do
                 if i <> 3 then
                   while Length(Res[i]) < max do
                     Res[i]:=' '+Res[i];
               for i:=1 to max do
                 if (Res[2][i] = ' ') and (Res[4][i] = ' ') then
                   Res[3]:=Res[3]+' '
                 else
                   Res[3]:=Res[3]+'-';
               for i:=1 to 4 do
                 WriteLn(Res[i]);
             end;
        '-': begin
               Res[1]:=LongToStr(A);
               Res[2]:='-'+LongToStr(B);
               Sub(A,B);
               Res[3]:='';
               Res[4]:=LongToStr(A);
               max:=0;
               for i:=1 to 4 do
                 if Length(Res[i]) > max then
                   max:=Length(Res[i]);
               for i:=1 to 4 do
                 if i <> 3 then
                   while Length(Res[i]) < max do
                     Res[i]:=' '+Res[i];
               for i:=1 to max do
                 if (Res[2][i] = ' ') and (Res[4][i] = ' ') then
                   Res[3]:=Res[3]+' '
                 else
                   Res[3]:=Res[3]+'-';
               for i:=1 to 4 do
                 WriteLn(Res[i]);
             end;
        '*': begin
               Res[1]:=LongToStr(A);
               Res[2]:='*'+LongToStr(B);
               Res[3]:='';
               if B[0] > 1 then
                 begin
                   Res[B[0]+4]:='';
                   St:='';
                   for i:=1 to B[0] do
                     begin
                       Mult(A,B[i],C);
                       Res[i+3]:=LongToStr(C)+St;
                       St:=St+' ';
                     end;
                   MultLong(A,B,C);
                   Res[B[0]+5]:=LongToStr(C);
                   max:=0;
                   for i:=1 to B[0]+5 do
                     if Length(Res[i]) > max then
                       max:=Length(Res[i]);
                   for i:=1 to B[0]+5 do
                     if (i <> 3) and (i <> B[0]+4) then
                       while Length(Res[i]) < max do
                         Res[i]:=' '+Res[i];
                   for i:=1 to max do
                     if (Res[2][i] = ' ') and (Res[4][i] = ' ') then
                       Res[3]:=Res[3]+' '
                     else
                       Res[3]:=Res[3]+'-';
                   for i:=1 to max do
                     if (Res[B[0]+3][i] = ' ') and (Res[B[0]+5][i] = ' ') then
                       Res[B[0]+4]:=Res[B[0]+4]+' '
                     else
                       Res[B[0]+4]:=Res[B[0]+4]+'-';
                   for i:=1 to B[0]+5 do
                     WriteLn(Res[i]);
                 end
               else
                 begin
                   MultLong(A,B,C);
                   Res[3]:='';
                   Res[4]:=LongToStr(C);
                   max:=0;
                   for i:=1 to 4 do
                     if Length(Res[i]) > max then
                       max:=Length(Res[i]);
                   for i:=1 to 4 do
                     if i <> 3 then
                       while Length(Res[i]) < max do
                         Res[i]:=' '+Res[i];
                   for i:=1 to max do
                     if (Res[2][i] = ' ') and (Res[4][i] = ' ') then
                       Res[3]:=Res[3]+' '
                   else
                     Res[3]:=Res[3]+'-';
                   for i:=1 to 4 do
                     WriteLn(Res[i]);
                 end;
             end;
      end;
      dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.