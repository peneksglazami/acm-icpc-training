{Problem: 2454 - Chemical reactions
 ACM ICPC - Europe - Northeastern - 2001/2002
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem2454;
{$APPTYPE CONSOLE}
const
  MaxL = 100;
  UpLetters = ['A'..'Z'];
  LowLetters = ['a'..'z'];
  Digits = ['0'..'9'];

type
  Formula = record
    elem: array [1..MaxL] of String[2];
    times: array [1..MaxL] of Integer;
    cnt: Integer;
  end;

var
  Left,Right: Formula;
  i,j,N,Test: Integer;
  LeftSt,RightSt: String;

procedure QuickSort(var f: Formula);

  procedure Sort(l,r: Integer);
  var
    i,j,buf: Integer;
    e,buf_st: String;
  begin
    i:=l;
    j:=r;
    e:=f.elem[(l+r) div 2];
    repeat
      while f.elem[i] < e do inc(i);
      while e < f.elem[j] do dec(j);
      if i <= j then
        begin
          buf_st:=f.elem[i]; f.elem[i]:=f.elem[j]; f.elem[j]:=buf_st;
          buf:=f.times[i]; f.times[i]:=f.times[j]; f.times[j]:=buf;
          inc(i); dec(j);
        end;
    until i > j;
    if i < r then Sort(i,r);
    if j > l then Sort(l,j);
  end;

begin
  Sort(1,f.cnt);
end;

procedure AddFormula(var f1: Formula; const f2: Formula);
var
  i,j: Integer;
begin
  for i:=1 to f2.cnt do
    for j:=1 to f1.cnt+1 do
      if j = f1.cnt+1 then
        begin
          inc(f1.cnt);
          f1.elem[j]:=f2.elem[i];
          f1.times[j]:=f2.times[i];
        end
      else
        if f2.elem[i] = f1.elem[j] then
          begin
            inc(f1.times[j],f2.times[i]);
            Break;
          end;
end;

procedure Mult(var f: Formula; X: Integer);
var
  i: Integer;
begin
  for i:=1 to f.cnt do
    f.times[i]:=X*f.times[i];
end;

procedure AddElem(elem: String; times: Integer; var f: Formula);
var
  i: Integer;
begin
  for i:=1 to f.cnt do
    if f.elem[i] = elem then
      begin
        inc(f.times[i],times);
        Exit;
      end;
  inc(f.cnt);
  f.elem[f.cnt]:=elem;
  f.times[f.cnt]:=times;
end;

procedure StrToFormula(St: String; var f: Formula);
var
  i,j,k,coef,times,Er,Br: Integer;
  S,elem: String;
  ff: Formula;
begin
  f.cnt:=0;
  if Pos('+',St) <> 0 then
    begin
      St:=St+'+';
      while St <> '' do
        begin
          StrToFormula(Copy(St,1,Pos('+',St)-1),ff);
          AddFormula(f,ff);
          Delete(St,1,Pos('+',St));
        end;
    end
  else
    begin
      if St = '' then
        Exit;
      if St[1] in Digits then
        begin
          i:=1;
          while St[i] in Digits do
            begin
              S:=S+St[i];
              inc(i);
            end;
          Val(S,coef,Er);
          Delete(St,1,i-1);
        end
      else
        coef:=1;
      while Pos('(',St) <> 0 do
        begin
          i:=Pos('(',St);
          j:=i;
          br:=0;
          repeat
            if St[j] = '(' then
              inc(br)
            else
              if St[j] = ')' then
                dec(br);
            inc(j);
          until br = 0;
          St:=St+' ';
          k:=j;
          S:='';
          while St[k] in Digits do
            begin
              S:=S+St[k];
              inc(k);
            end;
          Delete(St,Length(St),1);    
          StrToFormula(S+Copy(St,i+1,j-i-2),ff);
          AddFormula(f,ff);
          Delete(St,i,k-i);
        end;
      St:=St+' ';
      while St <> ' ' do
        begin
          S:=St[1];
          i:=2;
          while St[i] in LowLetters do
            begin
              S:=S+St[i];
              inc(i);
            end;
          elem:=S;
          if St[i] in Digits then
            begin
              S:=St[i];
              i:=i+1;
              while St[i] in Digits do
                begin
                  S:=S+St[i];
                  inc(i);
                end;
              Val(S,times,Er);
            end
          else
            times:=1;
          AddElem(elem,times,f);
          Delete(St,1,i-1);
        end;
      Mult(f,coef);
    end;
end;

function Equal(const f1,f2: Formula): Boolean;
var
  i: Integer;
begin
  Result:=False;
  if f1.cnt <> f2.cnt then
    Exit;
  for i:=1 to f1.cnt do
    if (f1.elem[i] <> f2.elem[i]) or (f1.times[i] <> f2.times[i]) then
      Exit;
  Result:=True;
end;

begin
  ReadLn(Test);
  while Test > 0 do
    begin
      ReadLn;
      ReadLn(LeftSt);
      StrToFormula(LeftSt,Left);
      QuickSort(Left);
      ReadLn(N);
      for i:=1 to N do
        begin
          ReadLn(RightSt);
          StrToFormula(RightSt,Right);
          QuickSort(Right);
          if Equal(Left,Right) then
            WriteLn(LeftSt,'==',RightSt)
          else
            WriteLn(LeftSt,'!=',RightSt);
        end;
      dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.