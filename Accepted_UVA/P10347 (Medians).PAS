{Problem: 10347 - Medians
 Problem C - August2002 Monthly Contest
 Author: Shahriar Manzoor
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem10347 (input,output);
Const
  Approx = 5e-10;

Var
  a,b,c,x,y,z,a1,a2,a3,m1,m2,m3: Double;
  Ok: Boolean;

Function S(a,b,c: Double): Double;
Var
  p: Double;
Begin
  p:=(a+b+c)/2;
  S:=Sqrt(p*(p-a)*(p-b)*(p-c));
end;

Begin
  While not EOF do
    Begin
      ReadLn(m1,m2,m3);
      Ok:=(m1 > 0) and (m2 > 0) and (m3 > 0);
      if Ok then
        Begin
          a1:=Sqr(m1);
          a2:=Sqr(m2);
          a3:=Sqr(m3);
          z:=(8*a1+8*a2-4*a3)/9;
          y:=(8*a1+4*a2-6*z)/3;
          x:=2*y+2*z-4*a1;
          Ok:=(x > 0) and (y > 0) and (z > 0);
          if Ok then
            Begin
              a:=Sqrt(x);
              b:=Sqrt(y);
              c:=Sqrt(z);
              Ok:=(a < b+c) and (b < a+c) and (c < a+b);
              if Ok then
                Begin
                  if S(a,b,c) >= Approx then
                    WriteLn(S(a,b,c):0:3)
                  else
                    WriteLn('-1.000');
                end
              else
                WriteLn('-1.000');
            end
          else
            WriteLn('-1.000');
        end
      else
        WriteLn('-1.000');
    end;
end.