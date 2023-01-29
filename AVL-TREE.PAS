uses graph,crt;
const
 xb=320;
 yb=0;
 rad=4;
 xsh=rad*2;
 ysh=rad*5;
 bcol=8;
 linecol=1;
 textcol=14;
 circol=4;
 esc=#27;


type
 direction=-1..1;
 keytype=integer;
 tree=^elem;
 elem=record
       key:keytype;
       left:tree;
       right:tree;
       bal:-200..200;
    (* container:containertype *)
      end;
procedure balance(var t:tree);
 var b,c:tree;
begin
 if t^.bal=2 then
  case t^.right^.bal of
  1:	begin
   		t^.bal:=0;
   		b:=t^.right;
   		t^.right:=b^.left;
   		b^.left:=t;
   		t:=b;
   		t^.bal:=0
  		end;
  0:   t^.bal:=1;
 -1:	begin
   		t^.bal:=0;
   		b:=t^.right;
   		t^.right:=b^.left^.left;
  	 	b^.left^.left:=t;
   		t:=b^.left;
   		c:=t^.right;
   		t^.right:=b;
   		t^.right^.left:=c;
   		t^.bal:=0;
  end;
 end
  else if t^.bal=-2 then
  case t^.left^.bal of
  -1:	begin
   		t^.bal:=0;
   		b:=t^.left;
   		t^.left:=b^.right;
   		b^.right:=t;
   		t:=b;
   		t^.bal:=0;
  		end;
  0:   t^.bal:=-1;
  1:	begin
   		t^.bal:=0;
   		b:=t^.left;
   		t^.left:=b^.right^.right;
   		b^.right^.right:=t;
   		t:=b^.right;
   		c:=t^.left;
   		t^.left:=b;
   		t^.left^.right:=c;
   		t^.bal:=0;
  end;
 end;
end;

procedure add(var t:tree;e:keytype);
begin
 if t=nil then
  begin
   new(t);
   t^.left:=nil;
   t^.right:=nil;
   t^.key:=e;
   t^.bal:=0;
  end else
 if e>t^.key then begin add(t^.right,e); inc(t^.bal) end else
  if e<t^.key then begin add(t^.left,e); dec(t^.bal) end;
  balance(t);
end;
procedure show(t:tree;dir:direction;x,y:integer);
var xn,yn:integer;s:string[3];
begin
 if t<>nil then
 begin
  xn:=getmaxx;
  for yn:=0 to y div ysh do xn:=xn div 2;
  xn:=x+dir*xn;yn:=y+ysh;
  show(t^.left,-1,xn,yn);
  show(t^.right,1,xn,yn);
  setcolor(linecol);
  line(x,y,xn,yn);
  setcolor(circol);
  circle(xn,yn,rad);
  str(t^.key,s);
  setcolor(textcol);
  outtextxy(xn,yn-1,s);
  str(t^.bal,s);
  outtextxy(xn,yn+5,s);
 end;
end;

var
 t:tree;
 n:keytype;
 gd,gm:integer;
begin
 randomize;
                gd:=detect;
                initgraph(gd,gm,'d:\bp\bgi');
 settextstyle(2,0,rad-1);
 setfillstyle(1,bcol);
 SetTextJustify(1,1);
 t:=nil;
 repeat
  readln(n);
  add(t,n);
  cleardevice;
  show(t,0,xb,yb);
 until readkey=esc;

end.