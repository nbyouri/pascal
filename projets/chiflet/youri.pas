unit youri;

interface

uses
    crt;
var
    vartemp : string;
    premnbre,deuxnbre,solu : integer;
    op : char;

function calcul(premnbre,deuxnbre : integer; op : char) : integer;
function checkerreur(vartemp : string) : integer;
procedure verification;
procedure separateur;

implementation

function calcul(premnbre,deuxnbre : integer; op : char) : integer;
begin
    case op of
    '+' : calcul := premnbre + deuxnbre;
    '-' : calcul := premnbre - deuxnbre;
    '*' : calcul := premnbre * deuxnbre;
    '/' : calcul := premnbre div deuxnbre;
end;
end;

function checkerreur(vartemp : string) : integer;
var
    i,error : integer;
begin
    val(vartemp,i,error);
    while (error <> 0) do begin
        write('entrer valeur entiere : ');
        readln(vartemp);
        val(vartemp,i,error);
    end;
    checkerreur := i;
end;

procedure separateur;
var 
s : string;
begin
    s := stringofchar('-',50);
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
            writeln('Resultat de la division non entiere! ');
    end;
end;

end.

