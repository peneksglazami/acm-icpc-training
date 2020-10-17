{Problem: 10700 - Camel trading
 Solved by Andrey Grigorov}
 
{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
Program Problem10700 (input, output);
Var
  T: Array [1..12,1..12] of Int64;
  Op: Array [1..11] of Char;
  i,j,k,M,N,L,Er: Integer;
  r_max,r_min: Int64;
  St,Num: String;


Function Max(a,b :Int64): Int64;
Begin
  if a > b then
    Max:=a
  else
    Max:=b;
end;

Function Min(a,b :Int64): Int64;
Begin
  if a < b then
    Min:=a
  else
    Min:=b;
end;

Begin
  ReadLn(N);
  While N > 0 do
    Begin
      FillChar(T,SizeOf(T),0);
      ReadLn(St);
      i:=1;
      M:=0;
      While i <= Length(St) do
        Begin
          Inc(M);
          Num:='';
          While (i <= Length(St)) and (St[i] in ['0'..'9']) do
            Begin
              Num:=Num+St[i];
              Inc(i);
            end;
          Val(Num,T[M,M],Er);
          if not (i <= Length(St)) then
            Break;
          Op[M]:=St[i];
          Inc(i);
        end;
      for L:=1 to M do
        for i:=1 to M-L do
          Begin
            j:=i+L;
            r_max:=Low(Int64);
            r_min:=High(Int64);
            for k:=i to j-1 do
              Case Op[k] of
                '+': Begin
                       r_max:=Max(r_max,T[i,k]+T[k+1,j]);
                       r_min:=Min(r_min,T[k,i]+T[j,k+1]);
                     end;
                '*': Begin
                       r_max:=Max(r_max,Max(Max(T[i,k]*T[k+1,j],T[k,i]*T[j,k+1]),
                                            Max(T[i,k]*T[j,k+1],T[k,i]*T[k+1,j])));
                       r_min:=Min(r_min,Min(Min(T[i,k]*T[k+1,j],T[k,i]*T[j,k+1]),
                                            Min(T[i,k]*T[j,k+1],T[k,i]*T[k+1,j])));
                     end;
               end;
            T[i,j]:=r_max;
            T[j,i]:=r_min;
          end;
      WriteLn('The maximum and minimum are ',T[1,M],' and ',T[M,1],'.');
      Dec(N);
    end;
end.