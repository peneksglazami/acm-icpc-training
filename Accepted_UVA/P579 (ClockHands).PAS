{Problem: 579 - ClockHands
 Author: Miguel A. Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N+,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem579 (input,output);
Const
  MaxTime = 12*60;

Var
  Angle1,Angle2,Angle: Double;
  H,M: LongInt;
  Er: Integer;
  St: String;

Begin
  ReadLn(St);
  While St <> '0:00' do
    Begin
      Val(Copy(St,1,Pos(':',St)-1),H,Er);
      Delete(St,1,Pos(':',St));
      Val(St,M,Er);
      Angle1:=(360*(H*60+M))/MaxTime;
      Angle2:=6*M;
      ReadLn(St);
      Angle:=Abs(Angle1-Angle2);
      While Angle > 180 do
        Angle:=360-Angle;
      WriteLn(Angle:0:3);
    end;
end.