    Program Binarnoie_Derevo_Poiska;

    Uses Crt;

    Type
        Ptr=^Rec;
        Rec=Record
	    Num:integer;
           Left:Ptr;
          Write:Ptr;
        end;

    Var
          Tree:Ptr;
        TmpPtr:Ptr;
           Tmp:Ptr;
	     B:Integer;

    Procedure Cls;

    begin
        ClrScr;
    WriteLn('-----------------------------------------------------------------');
    WriteLn('                     Бинарное дерево поиска                      ');
    WriteLn('-----------------------------------------------------------------');
    end;

    Procedure FindPlace;

    begin
        TmpPtr:=Tree;
        Repeat
	 If (((Tmp^.Num)>(TmpPtr^.Num))and((TmpPtr^.Write)<>Nil)) then begin
	    Tmp^.Left:=TmpPtr;
	    TmpPtr:=TmpPtr^.Write;
	end;
	If (((Tmp^.Num)<(TmpPtr^.Num))and((TmpPtr^.Left)<>Nil)) then begin
	    Tmp^.Left:=TmpPtr;
	    TmpPtr:=TmpPtr^.Left;
	end;
	If ((Tmp^.Num)=(TmpPtr^.Num)) then exit
    Until ((((TmpPtr^.Write)=Nil)and((Tmp^.Num)>(TmpPtr^.Num)))or(((TmpPtr^.Left)=Nil)and((Tmp^.Num)<(TmpPtr^.Num))));
end;

Procedure Pechat(TmpPtr:Ptr);

Var
    k:String;

begin
    k:='';
    If TmpPtr^.Left<>Nil then
	Pechat(TmpPtr^.Left);
    If (TmpPtr=Tree) then
	k:='<=-';
    WriteLn('-=>',TmpPtr^.Num,k);
    k:='';
    If TmpPtr^.Write<>Nil then
	Pechat(TmpPtr^.Write);
end;

Procedure Ravenstvo;

begin
    Repeat
	If ((Tmp^.Num)=(TmpPtr^.Num)) then begin
	    WriteLn('Такой элемент уже есть! Введите другой!');
	    ReadLn(Tmp^.Num);
	    TmpPtr:=Tree;
	    FindPlace;
	end;
    Until ((Tmp^.Num)<>(TmpPtr^.Num));
end;

Procedure Add;

begin
    If ((Tmp^.Num)>(TmpPtr^.Num)) then begin
	New(TmpPtr^.Write);
	TmpPtr:=TmpPtr^.Write;
	TmpPtr^.Num:=Tmp^.Num;
	TmpPtr^.Write:=Nil;
	TmpPtr^.Left:=Nil;
    end;
    If ((Tmp^.Num)<(TmpPtr^.Num)) then begin
        New(TmpPtr^.Left);
	TmpPtr:=TmpPtr^.Left;
	TmpPtr^.Num:=Tmp^.Num;
	TmpPtr^.Write:=Nil;
	TmpPtr^.Left:=Nil;
    end;
end;

Procedure MakeTree;

Var
    Flag:Char;

begin
    Tmp:=Nil;
    New(Tmp);
    Tree:=Nil;
    New(Tree);
    TmpPtr:=Tree;
    WriteLn('Введите элемент {Byte}...');
    ReadLn(TmpPtr^.Num);
    TmpPtr^.Write:=Nil;
    TmpPtr^.Left:=Nil;
    WriteLn('<Esc>-Выход! Др. клавиша - продолжение!');
    Repeat
	Flag:=ReadKey;
	Cls;
	If Flag<>#27 then begin
	    WriteLn('Введите ещё элемент {Byte}...');
	    ReadLn(Tmp^.Num);
	    FindPlace;
	    Ravenstvo;
	    Add;
	    WriteLn('<Esc>-Выход! Др. клавиша - продолжение!');
	end;
    Until Flag=#27;
end;

Procedure Unde;

begin
    WriteLn('-----------------------------------------------------------------');
    WriteLn('                   Нажмите клавишу для выхода                    ');
    WriteLn('-----------------------------------------------------------------');
end;

Procedure MakeMenu;

begin
    Repeat
	Cls;
	WriteLn('-----------------------------> Меню <----------------------------');
	WriteLn('1 - Добавить элемент.');
	WriteLn('2 - Удалить лист.');
	WriteLn('3 - Распечатать дерево.');
	WriteLn('4 - Выйти из программы.');
	If (B>4)or(B<1) then WriteLn('-------------------> Введите число от 1 до 4 <-------------------')
	else WriteLn('-----------------------------------------------------------------');
	ReadLn(B);
    Until (B>=1)and(B<=4);
end;

Procedure Chace;

begin
    If B=1 then begin
	WriteLn('Введите элемент, который хотите добавить!');
	ReadLn(Tmp^.Num);
	FindPlace;
	Ravenstvo;
	Add;
	Exit;
    end;
    If B=2 then begin
	WriteLn('Введите элемент, который хотите удалить!');
	ReadLn(Tmp^.Num);
	If (Tmp^.Num)=(Tree^.Num) then begin
	    WriteLn('Это не лист, а корень! Его нельзя удалить!');
	    WriteLn('Придумайте что-нибудь другое!');
	    ReadKey;
	    Exit;
	end;
	FindPlace;
	If (TmpPtr^.Num)=(Tmp^.Num) then
	    If (TmpPtr^.Write)=Nil then
		If (TmpPtr^.Left)=Nil then begin
		    If (Tmp^.Left^.Left^.Num)=(Tmp^.Num) then
			Tmp^.Left^.Left:=Nil;
		    If (Tmp^.Left^.Write^.Num)=(Tmp^.Num) then
			Tmp^.Left^.Write:=Nil;
		    DisPose(TmpPtr);
		end else WriteLn('Это не лист, а ветка!')
	    else WriteLn('Это не лист, а ветка!')
	else WriteLn('Этого элемента не существует!');
	ReadKey;
	Exit;
    end;
    If B=3 then begin
	TmpPtr:=Tree;
	Pechat(TmpPtr);
	ReadKey;
	Exit;
    end;
end;

Procedure Kill(TmpPtr:Ptr);

begin
    If TmpPtr^.Left<>Nil then
	Kill(TmpPtr^.Left);
    If TmpPtr^.Write<>Nil then
	Kill(TmpPtr^.Write);
    DisPose(TmpPtr);
end;

Begin
    B:=3;
    Cls;
    MakeTree;
    Repeat
	MakeMenu;
	Chace;
    Until B=4;
    TmpPtr:=Tree;
    Kill(TmpPtr);
    Unde;
    ReadKey;
end.