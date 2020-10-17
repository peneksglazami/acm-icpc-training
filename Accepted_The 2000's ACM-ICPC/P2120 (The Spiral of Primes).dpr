{ICPC ACM 2000/2001 North America - North Central
 Problem F - The Spiral of Primes
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem2120 (input,output);
{$APPTYPE CONSOLE}
Const
  D: Array [0..3,1..2] of ShortInt = ((1,0),(0,1),(-1,0),(0,-1));

Var
  Prime: Array [0..1229] of Integer;
  i,j,F_X,F_Y,X,Y,N,Dir,Er,Step,StepDone,n_case: Integer;
  St: String;

Procedure CreatePrime;
Var
  i,j: Integer;
  Ok: Boolean;
Begin
  FillChar(Prime,SizeOf(Prime),0);
  for i:=2 to 10000 do
    Begin
      j:=1;
      Ok:=True;
      While (j <= Prime[0]) and (i >= Sqr(Prime[j])) and Ok do
        Begin
          Ok:=i mod Prime[j] <> 0;
          Inc(j);
        end;
      if Ok then
        Begin
          Inc(Prime[0]);
          Prime[Prime[0]]:=i;
        end;
    end;
end;

Begin
  CreatePrime;
  ReadLn(St);
  n_case:=0;
  While St <> '-999' do
    Begin
      Val(Copy(St,1,Pos(' ',St)-1),F_X,Er);
      Delete(St,1,Pos(' ',St));
      Val(St,F_Y,Er);
      X:=0;
      Y:=0;
      N:=1;
      Dir:=0;
      StepDone:=0;
      Step:=2;
      While (X <> F_X) or (Y <> F_Y) do
        Begin
          Inc(N);
          Inc(X,D[Dir,1]);
          Inc(Y,D[Dir,2]);
          Inc(StepDone);
          if StepDone = Step div 2 then
            Dir:=(Dir+1) mod 4;
          if StepDone = Step then
            Begin
              Step:=Step+2;
              StepDone:=0;
              Dir:=(Dir+1) mod 4;
            end;
        end;
      Inc(n_case);
      WriteLn('Case ',n_case,': The prime at location (',F_X,',',F_Y,') is ',Prime[N],'.');
      ReadLn(St);
      if St <> '-999' then
        WriteLn;
    end;
end.
