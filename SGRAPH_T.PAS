program test_sgraph;
uses sgraph,graph,crt,dos;
VAR
X :INTEGER;
D :ARRAY[1..63590] OF BYTE;
y :real;
h1,m1,s1,ss1,h2,m2,s2,ss2 :word;

Procedure ig;
var
  grDriver: Integer;
  grMode: Integer;
  ErrCode: Integer;
begin
  grDriver := Detect;
  InitGraph(grDriver, grMode,'');
end;

begin
initsgraph('800x600');
{ig;}
getTime(h1,m1,s1,ss1);
testgraph;
getTime(h2,m2,s2,ss2);
readkey;
CloseGraph;
Writeln(h1,': ',m1,': ',s1,': ',ss1);
Writeln(h2,': ',m2,': ',s2,': ',ss1);

end.
