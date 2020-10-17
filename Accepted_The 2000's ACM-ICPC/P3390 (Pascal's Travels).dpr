{Problem: 3390 - Pascal's Travels
 ACM ICPC - North America - Mid Central - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S+,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
Program Problem3390 (input,output);
Const
  MaxN = 34;

Var
  a: Array [1..MaxN,1..MaxN] of Integer;
  t,newt: Array [1..MaxN,1..MaxN] of Int64;
  f: Array [1..MaxN,1..MAxN] of Boolean;
  s1,s2: Array [1..MaxN*MaxN] of Record r,c: Integer; end;
  i,j,N,ss1,ss2: Integer;
  Sum: Int64;
  Ch: Char;

Begin
  ReadLn(N);
  While N <> -1 do
    Begin
      for i:=1 to N do
        Begin
          for j:=1 to N do
            Begin
              Read(Ch);
              if Ch = '0' then
                a[i,j]:=MaxN
              else
                a[i,j]:=Ord(Ch)-Ord('0');
            end;
          ReadLn;
        end;
      FillChar(t,SizeOf(t),0);
      t[1,1]:=1;
      ss1:=1;
      s1[1].r:=1;
      s1[1].c:=1;
      Sum:=0;
      Repeat
        ss2:=ss1;
        s2:=s1;
        ss1:=0;
        FillChar(newt,SizeOf(newt),0);
        FillChar(f,SizeOf(f),False);
        for i:=1 to ss2 do
          Begin
            if s2[i].r+a[s2[i].r,s2[i].c] <= N then
              Begin
                newt[s2[i].r+a[s2[i].r,s2[i].c],s2[i].c]:=newt[s2[i].r+a[s2[i].r,s2[i].c],s2[i].c]+t[s2[i].r,s2[i].c];
                if not f[s2[i].r+a[s2[i].r,s2[i].c],s2[i].c] then
                  Begin
                    Inc(ss1);
                    s1[ss1].r:=s2[i].r+a[s2[i].r,s2[i].c];
                    s1[ss1].c:=s2[i].c;
                    f[s2[i].r+a[s2[i].r,s2[i].c],s2[i].c]:=True;
                  end;
              end;
            if s2[i].c+a[s2[i].r,s2[i].c] <= N then
              Begin
                newt[s2[i].r,s2[i].c+a[s2[i].r,s2[i].c]]:=newt[s2[i].r,s2[i].c+a[s2[i].r,s2[i].c]]+t[s2[i].r,s2[i].c];
                if not f[s2[i].r,s2[i].c+a[s2[i].r,s2[i].c]] then
                  Begin
                    Inc(ss1);
                    s1[ss1].r:=s2[i].r;
                    s1[ss1].c:=s2[i].c+a[s2[i].r,s2[i].c];
                    f[s2[i].r,s2[i].c+a[s2[i].r,s2[i].c]]:=True;
                  end;
              end;
          end;
        Sum:=Sum+newt[N,N];
        t:=newt;
      Until ss1 = 0;
      WriteLn(Sum);
      ReadLn(N);
    end;
end.