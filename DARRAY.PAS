Program DarrayObj;
uses crt;
type
    DPtr = ^DData;

	DData = record
    	Num  :integer;
    	Str  :string;
   		Next :DPtr;
    end;


	TDinArray = object
    Private
    DArray :DPtr;
    Public
    Capacity :Word;
    Constructor Create;
    Function GetCapacity :Word;
    Procedure Add(num: word; strr :string);
    Function Get(Num :Word) :String;
    Procedure Del(Num :word);
    Procedure Insert(num: word; strr :string);
    Destructor Destroy;
End;


Constructor TDinArray.Create;
begin
DArray := nil;
DArray^.Next := nil;
Capacity := 0;
end;

Function TDinArray.GetCapacity;
Var
X :word;
Temp :DPtr;
Begin
x := 0;
If Darray <> nil then
   begin
   Temp := DArray;
   While Temp^.next <> nil do
         begin
         Temp := Temp^.next;
         x := x + 1;
         end;
   end;
GetCapacity := x;
End;

Procedure TDinArray.Add;
Var
X :word;
Temp :DPtr;
Begin
If (DArray = Nil) then
	begin
	    New(DArray);
        DArray^.Next := nil;
        end;
    if Num = 0 then DArray^.Str := Strr;
{    else}
    begin
	    Temp := DArray;
    	For x := 0 to num do
		    begin
			If (Temp^.Next <> nil) then
				Temp := Temp^.Next
			else
				begin
				New(Temp^.Next);
				Temp := Temp^.Next;
				Temp^.Str := '';
				Temp^.Num := 0;
				Temp^.Next := Nil
				end;
			end;
	Temp^.Str := strr;
    end;
end;


Function TDinArray.Get;
Var
X :word;
Temp :DPtr;
Begin
Temp^ := DArray^;
{If Temp <> nil then Get := Temp^.Str else Get := '';}

If Num <> 0 then
begin
	For x := 0 to num do
		begin
	    If Temp^.Next <> nil then
       		begin
    		Temp := Temp^.Next;
	        Get := Temp^.Str;
    	    end
        	else
	        Get := '';
		end;
end
else
Get := Darray^.str;

end;

Procedure TDinArray.Del;
Var
X :word;
Temp :DPtr;
St :string;
Begin

If DArray <> nil then
	begin
	Temp := DArray;

If num > 0 then
	begin
		For x := 0 to num-1 do
                        begin
			If Temp^.Next <> nil then
			Temp := Temp^.Next;
    	    End;

	    If Temp^.Next^.Next <> Nil
		then
			Temp^.Next := Temp^.Next^.Next
	    else
			If Temp^.Next <> nil then Temp^.Next := nil
		end;
    end;

If num = 0 then
begin
st := Temp^.next^.next^.str;
Temp^ := Temp^.Next^;
Temp^.str := st;
end;
end;

Procedure TDinArray.Insert;
var
X :word;
Temp, Temp2 :DPtr;
begin
If (DArray = Nil) then
	begin
	    New(DArray);
        DArray^.Next := nil;
        end;
    if Num = 0 then DArray^.Str := Strr;
{    else}
    begin
	    Temp := DArray;
    	For x := 0 to num-1 do
		    begin
			If (Temp^.Next <> nil) then
				Temp := Temp^.Next
			else
				begin
				New(Temp^.Next);
				Temp := Temp^.Next;
				Temp^.Str := '';
				Temp^.Num := 0;
				Temp^.Next := Nil
				end;
			end;
    New(Temp2);
    Temp2^.Str := Strr;
    Temp2^.next := Temp^.next;
    Temp^.next := Temp2;
    end;
end;

Destructor TDinArray.Destroy;
Begin
Dispose(DArray);
end;

Var
Dar1 :TDinArray;
x1,x2 :integer;
s :string;
Ftext :text;

Begin
Dar1.Create;

Assign(FText,'aaa.txt');
reset(Ftext);
x1 := -1;
While not EOF(Ftext) do
begin
readln(Ftext,s);
x1 := x1 + 1;
Dar1.Add(x1,s);
end;

For  x2 := 0 to x1 do
Writeln(Dar1.get(x2));
Writeln(Dar1.GetCapacity);

Readln;
end.




















