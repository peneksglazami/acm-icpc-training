Program Problem10010 (input, output);
Var
  Letters: Array [1..50,1..50] of Char;
  i,j,g,M,N,K,Test,X,Y,mX,mY: Integer;
  St: String;
  Ok: Boolean;
Begin
  ReadLn(Test);
  for i:=1 to Test do
    Begin
      ReadLn;
      ReadLn(M,N);
      for j:=1 to M do
        Begin
          for g:=1 to N do
            Begin
              Read(Letters[j,g]);
              Letters[j,g]:=UpCase(Letters[j,g]);
            end;
          ReadLn;
        end;
      ReadLn(K);
      for j:=1 to K do
        Begin
          ReadLn(St);
          mX:=51;
          mY:=51;
          for g:=1 to Length(St) do
            St[g]:=UpCase(St[g]);
          for Y:=1 to M do
            for X:=1 to N do
              Begin
                if (Letters[Y,X] = St[1]) then
                  Begin

                    if ((X+Length(St)-1) <= N) then
                      Begin
                        Ok:=True;
                        for g:=X to X+Length(St)-1 do
                          if (Letters[Y,g] <> St[g-X+1]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;


                    if ((X-Length(St)+1) >=1 ) then
                      Begin
                        Ok:=True;
                        for g:=X downto X-Length(St)+1 do
                          if (Letters[Y,g] <> St[X-g+1]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;

                    if ((Y+Length(St)-1) <= M) then
                      Begin
                        Ok:=True;
                        for g:=Y to Y+Length(St)-1 do
                          if (Letters[g,X] <> St[g-Y+1]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;

                    if ((Y-Length(St)+1) >=1 ) then
                      Begin
                        Ok:=True;
                        for g:=Y downto Y-Length(St)+1 do
                          if (Letters[g,X] <> St[Y-g+1]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;


                    if ((X+Length(St)-1) <= N) and ((Y+Length(St)-1) <= M) then
                      Begin
                        Ok:=True;
                        for g:=1 to Length(St) do
                          if (Letters[Y+g-1,X+g-1] <> St[g]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;

                    if ((X-Length(St)+1) >=1) and ((Y-Length(St)+1) >=1) then
                      Begin
                        Ok:=True;
                        for g:=1 to Length(St) do
                          if (Letters[Y-g+1,X-g+1] <> St[g]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;

                    if ((X+Length(St)-1) <= N) and ((Y-Length(St)+1) >=1) then
                      Begin
                        Ok:=True;
                        for g:=1 to Length(St) do
                          if (Letters[Y-g+1,X+g-1] <> St[g]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;

                    if ((X-Length(St)+1) >=1) and ((Y+Length(St)-1) <= M) then
                      Begin
                        Ok:=True;
                        for g:=1 to Length(St) do
                          if (Letters[Y+g-1,X-g+1] <> St[g]) then
                            Ok:=False;
                        if Ok then
                          if Round(Sqrt(Sqr(X)+Sqr(Y))) <= Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                            Begin
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) = Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                if X < mX then
                                  Begin
                                    mX:=X;
                                    mY:=Y;
                                  end;
                              if Round(Sqrt(Sqr(X)+Sqr(Y))) < Round(Sqrt(Sqr(mX)+Sqr(mY))) then
                                Begin
                                  mX:=X;
                                  mY:=Y;
                                end;
                            end;
                      end;

                  end;
              end;
          WriteLn(mY,' ',mX);
          WriteLn;
        end;
    end;
end.