unit petitProjet;

interface
uses
    crt;
var
    vartemp : string;
    premnbre,deuxnbre : integer;
    op : char;
    ch : char;

procedure verification;
procedure separateur(ch : char);
function checkerreur(vartemp : string) : integer;


implementation    

function checkerreur(vartemp : string) : integer;
var
    int,error : integer;
begin
    val(vartemp,int,error);
    while (error <> 0) do begin
        write('entrer valeur entiere : ');
        readln(vartemp);
        val(vartemp,int,error);
    end;
    checkerreur := int;
end;

procedure separateur(ch : char);
var 
s : string;
begin
    s := stringofchar(ch,50);
    writeln('+',s,'+');
end;

procedure verification;
begin
    if not (op in ['+','-','/','*']) then begin
        write('Operateur incorrect! entrer +-*/! : ');
        readln(op);
    end;
    if (op = '/') then begin
        if (premnbre mod deuxnbre <> 0) then
            writeln('Division non entiere! ');
    end;
end;

end.

