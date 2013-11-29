program main;

uses    crt, youri, tom;

var i : integer;

begin
    erreur := false;
    initjoueurs;
    write('entrer premier nombre : ');  readln(vartemp);
    premnbre := strtoint(vartemp);
    write('entrer operateur : '); readln(vartemp);
    op := vartemp[1];
    write('entrer deuxiemme nombre : '); readln(vartemp);
    deuxnbre := strtoint(vartemp);
    verification;
    if not erreur then begin
        separateur;
        solu := calcul(premnbre,deuxnbre,op);
        writeln('Solution = ',solu);
        separateur;
    end;
    generateur;
    writeln(total);
    for i := 1 to maxnombres do begin
        write(' | ',nombres[i]);
    end;
    writeln(' |');
    readkey;
    writeln(joueurs[1].nom);
end.
