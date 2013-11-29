unit youri;

interface

uses
    crt;

type
    personne = record
        score : integer;
        nom : string;
    end;
    const 
    maxnombres = 6;
    maxjoueurs = 10;
var
    vartemp : string;
    i,total,premnbre,deuxnbre,solu,numjou : integer;
    op : char;
    nombres : array[1..maxnombres] of integer;
    joueurs : array[1..maxjoueurs] of personne;
    erreur : boolean;

function calcul(premnbre,deuxnbre : integer; op : char) : integer;
function strtoint(vartemp : string) : integer;
procedure generateur;
procedure initjoueurs;
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
else erreur := true;
    end;
end;

function strtoint(vartemp : string) : integer;
var
    i,error : integer;
begin
    val(vartemp,i,error);
    while (error <> 0) do begin
        write('entrer valeur entiere : ');
        readln(vartemp);
        val(vartemp,i,error);
    end;
    strtoint := i;
end;

procedure generateur;
begin
    randomize;
    total := random(899) + 100;
    for i := 1 to maxnombres do begin
        nombres[i] := random(9) + 1;
    end;
end;

procedure initjoueurs;
begin
    repeat
        write('Combien de joueurs ? (',maxjoueurs,' max) : ');
        readln(vartemp);
        numjou := strtoint(vartemp);
    until (numjou > 0) and (numjou < maxjoueurs);
    for i := 1 to numjou do begin
        write('Entrer le nom du joueur nr.',i,' : ');
        readln(joueurs[i].nom);
        joueurs[i].score := 0;
    end;
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

