unit youri;

interface

uses crt;

type personne = record
    score : integer;
    nom : string[10];
end;

const maxnombres = 6;
maxjoueurs = 10;

var
    vartemp : string[20];
    i,total,premnbre,deuxnbre,solu,numjou : integer;
    op : char;
    nombres : array[1..maxnombres] of integer;
    joueurs : array[1..maxjoueurs] of personne;
    erreur : boolean;

function calcul(premnbre,deuxnbre : integer; op : char) : integer;
function strtoint(vartemp : string) : integer;
procedure generateur;
procedure initjeu;
procedure initjoueurs;
procedure plateau;
procedure verification;
procedure separateur;

implementation

function calcul(premnbre,deuxnbre : integer; op : char) : integer;
begin
    if not erreur then begin
    case op of
    '+' : calcul := premnbre + deuxnbre;
    '-' : calcul := premnbre - deuxnbre;
    '*' : calcul := premnbre * deuxnbre;
    '/' : calcul := premnbre div deuxnbre;
else erreur := true;
end;
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
    for i := 0 to maxnombres do begin
        nombres[i] := random(9) + 1;
    end;
end;

procedure initjeu;
begin
    write('| entrer premier nombre : ');  readln(vartemp);
    premnbre := strtoint(vartemp);
    write('| entrer operateur : '); readln(vartemp);
    op := vartemp[1];
    write('| entrer deuxiemme nombre : '); readln(vartemp);
    deuxnbre := strtoint(vartemp);
    verification;
    separateur;
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

procedure plateau;
begin
    clrscr;
    separateur;
    write('|  =>  ');
    for i := 1 to maxnombres do begin
        write(nombres[i], '   |   ');
    end;
    writeln;
    separateur;
    writeln('| Nombre a trouver : ',total);
    separateur;
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
    while not (op in ['+','-','/','*']) do begin
        write('| !Operateur incorrect! entrer +-*/! : ');
        readln(vartemp);
        op := vartemp[1];
    end;
    if (op = '/') then  
    if (deuxnbre = 0) then begin
        writeln('| !Division par zero!');
        erreur := true; end else
    if (premnbre mod deuxnbre <> 0) then begin
        writeln('| !Resultat de la division non entiere! ');
        erreur := true;
    end; 
end;

end.

