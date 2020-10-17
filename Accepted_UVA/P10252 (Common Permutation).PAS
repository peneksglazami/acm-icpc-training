{Problem: 10252 - Common Permutation
 World Finals Warmup Occidental Contest
 Problem Source: University of Alberta Local Contest
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10252 (input,output);
Var
  A,B,C: Array [0..255] of Integer;
  i,j: Integer;
  Ch: Char;

Begin
  While not EOF do
    Begin
      FillChar(A,SizeOf(A),0);
      FillChar(B,SizeOf(B),0);
      While not EOLn do
        Begin
          Read(Ch);
          Inc(A[Ord(Ch)]);
        end;
      ReadLn;
      While not EOLn do
        Begin
          Read(Ch);
          Inc(B[Ord(Ch)]);
        end;
      ReadLn;
      for i:=0 to 255 do
        if A[i] < B[i] then
          for j:=1 to A[i] do
            Write(Chr(i))
        else
          for j:=1 to B[i] do
            Write(Chr(i));
      WriteLn;
    end;
end.