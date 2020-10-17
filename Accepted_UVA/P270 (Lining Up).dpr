{Problem: 270 - Lining Up
 East Central Regionals - 1994 - Problem A
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem270 (input,output);
{$APPTYPE CONSOLE}
Const
  MaxN = 700;

Type
  Line = Record
    a,b,c: Integer;
   end;

Var
  A: Array [1..MaxN*MaxN div 2+1] of Line;
  P: Array [1..MaxN] of Record x,y: Integer; end;
  i,j,Test,N,M,Er,nd,Max,K,iLine: Integer;
  St: String;

Function GCD(a,b: Integer): Integer;
Var
  nd: Integer;
Begin
  nd:=b;
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

Function Less(a,b: Line): Boolean;
Begin
  Less:=(a.a < b.a) or ((a.a = b.a) and (a.b < b.b)) or
        ((a.a = b.a) and (a.b = b.b) and (a.c < b.c));
end;

Procedure Sort(l,r: Integer);
Var
  i,j: Integer;
  x,buf: Line;
Begin
  i:=l;
  j:=r;
  x:=A[(l+r) div 2];
  Repeat
    While Less(a[i],x) do Inc(i);
    While Less(x,a[j]) do Dec(j);
    if i <= j then
      Begin
        buf:=a[i];
        a[i]:=a[j];
        a[j]:=buf;
        Inc(i);
        Dec(j);
      end;
  Until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

Function Equal(a,b: Line): Boolean;
Begin
  Equal:=(a.a = b.a) and (a.b = b.b) and (a.c = b.c);
end;

Begin
  ReadLn(Test);
  ReadLn;
  While Test > 0 do
    Begin
      ReadLn(St);
      N:=0;
      While St <> '' do
        Begin
          Inc(N);
          Val(Copy(St,1,Pos(' ',St)-1),p[N].x,Er);
          Delete(St,1,Pos(' ',St));
          Val(St,p[N].y,Er);
          if EOF then
            St:=''
          else
            ReadLn(St);
        end;
      M:=0;
      for i:=1 to N-1 do
        for j:=i+1 to N do
          Begin
            Inc(M);
            With A[M] do
              Begin
                a:=p[j].y-p[i].y;
                b:=p[i].x-p[j].x;
                c:=-a*p[i].x-b*p[i].y;
                nd:=GCD(Abs(a),GCD(Abs(b),Abs(c)));
                a:=a div nd;
                b:=b div nd;
                c:=c div nd;
                if a < 0 then
                  Begin
                    a:=-a;
                    b:=-b;
                    c:=-c;
                  end
                else
                  if a = 0 then
                    if b < 0 then
                      Begin
                        b:=-b;
                        c:=-c;
                      end
                    else
                      if b = 0 then
                        if c < 0 then
                          c:=-c;
              end;
          end;
      Sort(1,M);
      Max:=0;
      K:=1;
      for i:=2 to M do
        Begin
          if not Equal(A[i],A[i-1]) then
            Begin
              if Max < K then
                Max:=K;
              K:=1;
            end
          else
            Inc(K);
        end;
      if K > Max then
        Max:=K;
      WriteLn((1+Round(Sqrt(1+8*Max))) div 2);
      Dec(Test);
      if Test > 0 then
        WriteLn;
    end;
end.