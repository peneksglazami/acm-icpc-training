{Problem: 3375 - Queens, Knights and Pawns
 ACM ICPC - North America - East Central - 2005/2006
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3375;
{$APPTYPE CONSOLE}
const
  MaxL = 1000;
  dk: array [1..8,1..2] of Integer = ((1,2),(2,1),(2,-1),(1,-2),
                                     (-1,2),(-2,1),(-2,-1),(-1,-2));
  dq: array [1..8,1..2] of Integer = ((0,-1),(1,-1),(1,0),(1,1),
                                      (0,1),(-1,1),(-1,0),(-1,-1));

var
  t: array [-1..MaxL+2,-1..MaxL+2] of Byte;
  k,q: array [1..MaxL*MaxL] of record r,c: Integer; end;
  i,j,kk,kq,kp,r,c,N,M,safe,n_case: Integer;

begin
  n_case:=0;
  ReadLn(N,M);
  while (N <> 0) or (M <> 0) do
    begin
      FillChar(t,SizeOf(t),1);
      for i:=1 to N do
        for j:=1 to M do
          t[i,j]:=0;
      Read(kq);
      for i:=1 to kq do
        begin
          Read(q[i].r,q[i].c);
          t[q[i].r,q[i].c]:=1;
        end;
      Read(kk);
      for i:=1 to kk do
        begin
          Read(k[i].r,k[i].c);
          t[k[i].r,k[i].c]:=1;
        end;
      Read(kp);
      for i:=1 to kp do
        begin
          Read(r,c);
          t[r,c]:=1;
        end;
      safe:=N*M-kk-kq-kp;
      for i:=1 to kk do
        for j:=1 to 8 do
          if t[k[i].r+dk[j,1],k[i].c+dk[j,2]] = 0 then
            begin
              Dec(safe);
              t[k[i].r+dk[j,1],k[i].c+dk[j,2]]:=2;
            end;
      for i:=1 to kq do
        for j:=1 to 8 do
          begin
            r:=q[i].r+dq[j,1];
            c:=q[i].c+dq[j,2];
            while t[r,c] <> 1 do
              begin
                if t[r,c] = 0 then
                  begin
                    Dec(safe);
                    t[r,c]:=2;
                  end;
                Inc(r,dq[j,1]);
                Inc(c,dq[j,2]);
              end;
          end;
      Inc(n_case);
      WriteLn('Board ',n_case,' has ',safe,' safe squares.');
      ReadLn(N,M);
    end;
end.