{The 2004 ACM Asia Programming Contest - Dhaka
 Problem A - All Integer Average
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem3012 (input, output);
Var
  i,N,Sum,A,B,C,nod,n_case: LongInt;
  St: Array [1..3] of String;

Function GCD(a,b: LongInt): LongInt;
Var
  nd: LongInt;
Begin
  While a > 0 do
    Begin
      nd:=a;
      a:=b mod a;
      b:=nd;
    end;
  GCD:=nd;
end;

Begin
  Read(N);
  n_case:=1;
  While N <> 0 do
    Begin
      WriteLn('Case ',n_case,':');
      St[1]:='';
      St[2]:='';
      St[3]:='';
      Sum:=0;
      for i:=1 to N do
        Begin
          Read(A);
          Inc(Sum,A);
        end;
      A:=Sum div N;
      B:=Abs(Sum mod N);
      C:=N;
      if B <> 0 then
        Begin
          nod:=GCD(B,C);
          B:=B div nod;
          C:=C div nod;
          Str(B,St[1]);
          Str(C,St[3]);
          if A <> 0 then
            Begin
              Str(Abs(A),St[2]);
              if A < 0 then
                St[2]:='- '+St[2];
              for i:=1 to Length(St[2]) do
                St[3]:=' '+St[3];
              While Length(St[1]) < Length(St[3]) do
                St[1]:=' '+St[1];
              While Length(St[2]) < Length(St[3]) do
                St[2]:=St[2]+'-';
              WriteLn(St[1]);
              WriteLn(St[2]);
              WriteLn(St[3]);
            end
          else
            Begin
              if Sum < 0 then
                Begin
                  St[1]:='  '+St[1];
                  St[2]:='- ';
                  St[3]:='  '+St[3];
                end;
              While Length(St[1]) < Length(St[3]) do
                St[1]:=' '+St[1];
              While Length(St[2]) < Length(St[3]) do
                St[2]:=St[2]+'-';
              WriteLn(St[1]);
              WriteLn(St[2]);
              WriteLn(St[3]);
            end;
        end
      else
        Begin
          Str(Abs(A),St[2]);
          if A < 0 then
            St[2]:='- '+St[2];
          WriteLn(St[2]);
        end;
      Read(N);
      Inc(n_case);
    end;
end.