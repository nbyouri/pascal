program main;

uses    crt, youri, tom;

var i : integer;

begin
    initjoueurs;
    write('entrer premier nombre : ');  readln(vartemp);
    premnbre := strtoint(vartemp);
    write('entrer operateur : '); readln(op);
    write('entrer deuxiemme nombre : '); readln(vartemp);
    deuxnbre := strtoint(vartemp);
    verification;
    separateur;
    solu := calcul(premnbre,deuxnbre,op);
    writeln('Solution = ',solu);
    separateur;
    generateur;
    writeln(total);
    for i := 1 to maxnombres do begin
        writeln(i,' : ',nombres[i]);
    end;
    generateur;
    readkey;
end.
