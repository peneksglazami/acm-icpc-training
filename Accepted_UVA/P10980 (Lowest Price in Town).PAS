{Problem: 10980 - Lowest Price in Town
 Return of the Newbies 2005
 Problemsetter: Mak Yan Kei
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}
Program Problem10980 (input,output);
Const
  MaxM = 20;
  MaxK = 100;

Var
  r,buf: Array [0..MaxK] of Double;
  p: Array [0..MaxM] of Double;
  n: Array [1..MaxM] of Integer;
  i,j,g,h,m,k,n_case: Integer;

Begin
  n_case:=0;
  While not EOF do
    Begin
      ReadLn(p[0],m);
      for i:=1 to m do
        ReadLn(n[i],p[i]);
      for i:=0 to MaxK do
        r[i]:=p[0]*i;
      for i:=1 to m do
        Begin
          buf:=r;
          for j:=0 to MaxK do
            Begin
              g:=1;
              While j+(g-1)*n[i] <= MaxK do
                Begin
                  h:=j;
                  While (h <= j+g*n[i]) and (h <= MaxK) do
                    Begin
                      if buf[h] > r[j]+g*p[i] then
                        buf[h]:=r[j]+g*p[i];
                      Inc(h);
                    end;
                  Inc(g);
                end;
            end;
          r:=buf;
        end;
      Inc(n_case);
      WriteLn('Case ',n_case,':');
      While not EOLn do
        Begin
          Read(k);
          WriteLn('Buy ',k,' for $',r[k]:0:2);
        end;
    end;
end.