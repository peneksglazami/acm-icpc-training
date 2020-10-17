Program Problem10222 (input, output);
Var
  St: String;
  i: Integer;
Begin
  ReadLn(St);
  i:=0;
  While i <= Length(St) do
    Begin
      Case St[i] of
        'q': St[i]:='[';
        'w': St[i]:=']';
        'e': St[i]:='q';
        'r': St[i]:='w';
        't': St[i]:='e';
        'y': St[i]:='r';
        'u': St[i]:='t';
        'i': St[i]:='y';
        'o': St[i]:='u';
        'p': St[i]:='i';
        '[': St[i]:='o';
        ']': St[i]:='p';

        'a': St[i]:=';';
        's': St[i]:='''';
        'd': St[i]:='a';
        'f': St[i]:='s';
        'g': St[i]:='d';
        'h': St[i]:='f';
        'j': St[i]:='g';
        'k': St[i]:='h';
        'l': St[i]:='j';
        ';': St[i]:='k';
        '''': St[i]:='l';

        'z': St[i]:='.';
        'x': St[i]:='/';
        'c': St[i]:='z';
        'v': St[i]:='x';
        'b': St[i]:='c';
        'n': St[i]:='v';
        'm': St[i]:='b';
        ',': St[i]:='n';
        '.': St[i]:='m';
        '/': St[i]:=',';

        'Q': St[i]:='[';
        'W': St[i]:=']';
        'E': St[i]:='q';
        'R': St[i]:='w';
        'T': St[i]:='e';
        'Y': St[i]:='r';
        'U': St[i]:='t';
        'I': St[i]:='y';
        'O': St[i]:='u';
        'P': St[i]:='i';
        '{': St[i]:='o';
        '}': St[i]:='p';

        'A': St[i]:=';';
        'S': St[i]:='''';
        'D': St[i]:='a';
        'F': St[i]:='s';
        'G': St[i]:='d';
        'H': St[i]:='f';
        'J': St[i]:='g';
        'K': St[i]:='h';
        'L': St[i]:='j';
        ':': St[i]:='k';
        '"': St[i]:='l';

        'Z': St[i]:='.';
        'X': St[i]:='/';
        'C': St[i]:='z';
        'V': St[i]:='x';
        'B': St[i]:='c';
        'N': St[i]:='v';
        'M': St[i]:='b';
        '<': St[i]:='n';
        '>': St[i]:='m';
        '?': St[i]:=',';
       end;
    Inc(i);
    end;
  WriteLn(St);
end.