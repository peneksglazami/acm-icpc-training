{Problem: 3200 - Jill's Tour Paths
 ACM ICPC - North America - Pacific Northwest - 2004/2005
 Solved by Andrey Grigorov}

{$A+,B-,C+,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
program Problem3200;
{$APPTYPE CONSOLE}
const
  INFINITY = MaxInt div 2;
  MaxN = 20;
  MaxK = 20000;

type
  VSet = Set of 1..MaxN;

  TPath = record
    p: array [1..MaxN] of Integer;
    d: array [1..MaxN] of Integer;
    len: Integer;
  end;

  PNode = ^Node;

  Node = record
    path: TPath;
    next: PNode;
  end;

var
  a,a_copy: array [1..MaxN,1..MaxN] of Integer;
  p: array [1..MaxK] of TPath;
  ps,pp: TPath;
  L1: PNode;
  i,j,n_case,N,S,T,MAXDIST,p_cnt: Integer;
  No: Boolean;
  V: VSet;

procedure ReadData;
var
  i,j,R,x,y,l: Integer;
begin
  for i:=1 to N do
    for j:=1 to N do
      a[i,j]:=INFINITY;
  for i:=1 to N do
    a[i,i]:=0;
  Read(R);
  for i:=1 to R do
    begin
      Read(x,y,l);
      a[x,y]:=l;
      a[y,x]:=l;
    end;
  Read(S,T,MAXDIST);
end;

procedure Dejkstra(V: VSet; N,S,T: Integer; var path: TPath);
var
  d,p,rev: array [1..MaxN] of Integer;
  i,imin,min: Integer;
begin
  for i:=1 to N do
    d[i]:=INFINITY;
  d[S]:=0;
  path.len:=0;
  while T in V do
    begin
      min:=INFINITY;
      for i:=1 to N do
        if (i in V) and (min > d[i]) then
          begin
            imin:=i;
            min:=d[i];
          end;
      if min = INFINITY then
        Exit;
      V:=V-[imin];
      for i:=1 to N do
        if (i in V) and (d[i] > d[imin]+a[imin,i]) then
          begin
            d[i]:=d[imin]+a[imin,i];
            p[i]:=imin;
          end;
    end;
  while T <> S do
    begin
      Inc(path.len);
      rev[path.len]:=T;
      T:=p[T];
    end;
  Inc(path.len);
  rev[path.len]:=S;
  for i:=1 to path.len do
    begin
      path.p[i]:=rev[path.len-i+1];
      path.d[i]:=d[path.p[i]];
    end;
end;

function EqualFirstK(const p1,p2: TPath; k: Integer): Boolean;
var
  i: Integer;
begin
  Result:=False;
  if (p1.len < k) or (p2.len < k) then
    Exit;
  for i:=1 to k do
    if p1.p[i] <> p2.p[i] then
      Exit;
  Result:=True;
end;

function CmpPaths(const p1,p2: TPath): Integer;
var
  i,len: Integer;
begin
  if p1.d[p1.len] < p2.d[p2.len] then
    Result:=1
  else
    if p1.d[p1.len] > p2.d[p2.len] then
      Result:=-1
    else
      begin
        if p1.len < p2.len then
          len:=p1.len
        else
          len:=p2.len;
        for i:=1 to len do
          if p1.p[i] <> p2.p[i] then
            begin
              if p1.p[i] < p2.p[i] then
                Result:=1
              else
                Result:=-1;
              Exit;
            end;
        Result:=0;
      end;
end;

procedure AddToList(const Path: Tpath; var List: PNode);
var
  p,pre,pp: PNode;
begin
  if List = nil then
    begin
      New(List);
      List^.next:=nil;
      List^.path:=path;
    end
  else
    begin
      p:=List;
      pre:=nil;
      while p <> nil do
        case CmpPaths(path,p^.path) of
          1: begin
               New(pp);
               pp^.next:=p;
               pp^.path:=path;
               if pre = nil then
                 List:=pp
               else
                 pre^.next:=pp;
               Exit;
             end;
          -1: begin
                pre:=p;
                p:=p^.next;
              end;
          0: Exit;
        end;
      New(pre^.next);
      pre^.next^.path:=path;
      pre^.next^.next:=nil;
    end;
end;

procedure BestPath(var List: PNode; var path: TPath);
var
  p: PNode;
begin
  path:=List^.path;
  p:=List;
  List:=List^.next;
  Dispose(p);
end;

function Empty(const List: PNode): Boolean;
begin
  Result:=List = nil;
end;

procedure DeleteList(var List: PNode);
var
  p: PNode;
begin
  while List <> nil do
    begin
      p:=List;
      List:=List^.next;
      Dispose(p);
    end;
end;

procedure Sort(l,r: Integer);
var
  i,j: Integer;
  buf,x: TPath;
begin
  i:=l;
  j:=r;
  x:=p[(l+r) div 2];
  repeat
    while CmpPaths(p[i],x) = 1 do Inc(i);
    while CmpPaths(x,p[j]) = 1 do Dec(j);
    if i <= j then
      begin
        buf:=p[i]; p[i]:=p[j]; p[j]:=buf;
        Inc(i); Dec(j);
      end;
  until i > j;
  if i < r then Sort(i,r);
  if j > l then Sort(l,j);
end;

begin
  Read(N);
  n_case:=0;
  while N <> -1 do
    begin
      No:=False;
      ReadData;
      p_cnt:=0;
      Dejkstra([1..N],N,S,T,p[1]);
      if (p[1].len = 0) or (p[1].d[p[1].len] > MAXDIST) then
        No:=True
      else
        p_cnt:=1;
      a_copy:=a;
      L1:=nil;
      while not No and (p[p_cnt].d[p[p_cnt].len] <= MAXDIST) do
        begin
          Inc(p_cnt);
          V:=[1..N];
          for i:=1 to p[p_cnt-1].len-1 do
            begin
              for j:=1 to p_cnt-1 do
                if EqualFirstK(p[p_cnt-1],p[j],i) then
                  begin
                    a[p[p_cnt-1].p[i], p[j].p[i+1]]:=INFINITY;
                    a[p[j].p[i+1], p[p_cnt-1].p[i]]:=INFINITY;
                  end;
              Dejkstra(V,N,p[p_cnt-1].p[i],T,ps);
              if ps.len > 0 then
                begin
                  for j:=1 to i do
                    begin
                      pp.p[j]:=p[p_cnt-1].p[j];
                      pp.d[j]:=p[p_cnt-1].d[j];
                    end;
                  for j:=2 to ps.len do
                    begin
                      pp.p[i+j-1]:=ps.p[j];
                      pp.d[i+j-1]:=ps.d[j]+pp.d[i];
                    end;
                  pp.len:=i+ps.len-1;
                  AddToList(pp,L1);
                end;
              V:=V-[p[p_cnt-1].p[i]];
              a:=a_copy;
            end;
          if Empty(L1) then
            begin
              No:=True;
              Dec(p_cnt);
            end
          else
            BestPath(L1,p[p_cnt]);
        end;
      Inc(n_case);
      WriteLn('Case ',n_case,':');
      if p_cnt = 0 then
        WriteLn('NO ACCEPTABLE TOURS')
      else
        begin
          Sort(1,p_cnt);
          if not No then
            Dec(p_cnt);
          for i:=1 to p_cnt do
            begin
              Write(p[i].d[p[i].len],':');
              for j:=1 to p[i].len do
                Write(' ',p[i].p[j]);
              WriteLn;
            end;
        end;
      DeleteList(L1);
      Read(N);
      if N <> -1 then
       WriteLn;
    end;
end.