{Problem: 101 - The Blocks Problem
 Author: Miguel Revilla
 Solved by Andrey Grigorov}

{$A+,B-,D-,E+,F-,G-,I-,L-,N-,O-,P-,Q-,R-,S-,T-,V+,X+,Y+}
{$M 16384,0,655360}
Program Problem101 (input,output);
Const
  MaxN = 25;

Var
  a: Array [0..MaxN,1..MaxN] of Integer;
  m,p,pp: Array [0..MaxN] of Integer;
  i,N: Integer;
  St: String;

Procedure Trim(Var St: String);
Begin
  While St[1] = ' ' do
    Delete(St,1,1);
  While St[Length(St)] = ' ' do
    Delete(St,Length(St),1);
end;

Procedure StackOut(aa: Integer);
Var
  i: Integer;
Begin
  for i:=m[p[aa]] downto pp[aa]+1 do
    Begin
      m[a[p[aa],i]]:=1;
      p[a[p[aa],i]]:=a[p[aa],i];
      pp[a[p[aa],i]]:=1;
    end;
  m[p[aa]]:=pp[aa];
end;

Procedure Execute(comm: String; aa,bb: Integer);
Var
  i,buf1,buf2: Integer;
Begin
  if (aa = bb) or (p[aa] = p[bb]) then
    Exit;
  if comm = 'moveonto' then
    Begin
      StackOut(aa);
      StackOut(bb);
      Inc(m[p[bb]]);
      a[p[bb],m[p[bb]]]:=aa;
      Dec(m[p[aa]]);
      pp[aa]:=m[p[bb]];
      p[aa]:=p[bb];
    end
  else
    if comm = 'moveover' then
      Begin
        StackOut(aa);
        Inc(m[p[bb]]);
        a[p[bb],m[p[bb]]]:=aa;
        Dec(m[p[aa]]);
        pp[aa]:=m[p[bb]];
        p[aa]:=p[bb];
      end
    else
      if comm = 'pileonto' then
        Begin
          StackOut(bb);
          buf1:=pp[aa]-1;
          buf2:=p[aa];
          for i:=pp[aa] to m[p[aa]] do
            Begin
              Inc(m[p[bb]]);
              a[p[bb],m[p[bb]]]:=a[buf2,i];
              p[a[p[bb],m[p[bb]]]]:=p[bb];
              pp[a[p[bb],m[p[bb]]]]:=m[p[bb]];
            end;
          m[buf2]:=buf1;
        end
      else
        if comm = 'pileover' then
          Begin
            buf1:=pp[aa]-1;
            buf2:=p[aa];
            for i:=pp[aa] to m[p[aa]] do
              Begin
                Inc(m[p[bb]]);
                a[p[bb],m[p[bb]]]:=a[buf2,i];
                p[a[p[bb],m[p[bb]]]]:=p[bb];
                pp[a[p[bb],m[p[bb]]]]:=m[p[bb]];
              end;
            m[buf2]:=buf1;
          end;
end;

Procedure ExecuteCommand(St: String);
Var
  aa,bb,Er: Integer;
  com1,com2: String;
Begin
  Trim(St);
  com1:=Copy(St,1,4);
  Delete(St,1,5);
  Trim(St);
  Val(Copy(St,1,Pos(' ',St)-1),aa,Er);
  Delete(St,1,Pos(' ',St));
  Trim(St);
  com2:=Copy(St,1,4);
  Delete(St,1,5);
  Val(St,bb,Er);
  Execute(com1+com2,aa,bb);
end;

Procedure Print;
Var
  i,j: Integer;
Begin
  for i:=0 to N-1 do
    Begin
      if i < 10 then
        Write(' ');
      Write(i,':');
      for j:=1 to m[i] do
        Write(' ',a[i,j]);
      WriteLn;
    end;
end;

Begin
  {Assign(Input,'input.txt');
  Assign(Output,'output.txt');
  Reset(Input);
  ReWrite(Output);}
  ReadLn(N);
  for i:=0 to N-1 do
    Begin
      a[i][1]:=i;
      m[i]:=1;
      p[i]:=i;
      pp[i]:=1;
    end;
  ReadLn(St);
  While St <> 'quit' do
    Begin
      ExecuteCommand(St);
      ReadLn(St);
    end;
  Print;
  {Close(Input);
  Close(Output);}
end.