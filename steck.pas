Program STCK;
Uses crt;
type
    Steck = ^Elem; {Steck-⨯ ����騩 �� ����� �lem}
    Elem = record  {������}
	Inf: string;   {���� ������}
	Next: Steck    {���� ᫥���饣� �����}
    end;
var
    Temp,First: Steck; {Temp-�p������� ��p������� ��� �p������ ��p��
                        First-��p�c ��p���� ����� �������� ᯨ᪠}
    select:integer;    {��p������� ��� �롮� ����}

procedure Add(var P1:Steck);
var
    P: Steck; {�p������� ��p������� �p������ ����}
begin
    write ('������ ���祭��: ');
    {���� ���祭��}
    new(P); {�뤥�塞 ������ ��� ��p������� �}
    readln(P^.Inf); {���뢠�� ���祭�� � ���� Inf ��p������� �}
    P^.Next:=P1; {�����뢠�� ��। ����� � � ��砫� �⥪�}
    P1:=P; {�����頥� 㪠��⥫� �1 �� ��砫� �⥪�}
end;

procedure OUT(var first:Steck);
begin
    If first = nil then {�஢��塞: ���� �� ����� � �⥪�?}
	    writeln('�⥪ ���⮩.')
		else
        writeln ('����� � �⥪�:');
    Temp:=First;        {��ᢠ����� 㪠��⥫� First - Q}
    while Temp<> nil do {���� �⥪ �� �����稫��}
    begin
        writeln (Temp^.Inf); {�뢮��� ���祭��}
        Temp:=Temp^.Next 	{���᪠���� ���� �� �⥪�}
    end
end;

procedure DEL(var p1:steck);
begin
    if p1<>nil then {�᫨ �⥪ ᮧ���}
    begin
        Temp := p1^.next; {�p�ᢠ����� 㪠��⥫� P1^.Next �p�������
		               ��p������� Q}
        dispose(p1);   {����塞 �1 �� �����}
        p1 := Temp;
        writeln('��᫥���� ����� �⥪� 㤠���.');
    end
    else {�᫨ �⥪ ����}
		writeln ('�⥪ ���⮩.'); {�뢮��� ᮮ�饭��}
end;

{���� �᭮���� �ணࠬ��}
begin
    first:=nil; {������� ���⮩ �⥪}
    while (select<>4) do {�믮��塞 横� �� �� ��� ���� �� ������
        				  ������� 4 - �ਧ��� ��室� �� �ணࠬ��}
    begin
        writeln('1 - ����� ���祭�� � �⥪.');
        writeln('2 - ��ᬮ�� �⥪�.');
		writeln('3 - ����� ���祭�� �� �⥪�.');
		writeln('4 - ��室.');
		readln (select);
		clrscr;
		case select of {�롮� ����⢨�}
  			1 :ADD(First);
  			2 :OUT(First);
  			3 :DEL(First);
  		end;
	end;
end.