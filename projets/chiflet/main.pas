program main;

uses    crt, youri, tom;

var i : integer;

begin
    write('entrer premier nombre : ');  readln(vartemp);
    premnbre := checkerreur(vartemp);
    write('entrer operateur : '); readln(op);
    write('entrer deuxiemme nombre : '); readln(vartemp);
    deuxnbre := checkerreur(vartemp);
    verification;
    separateur;
    solu := calcul(premnbre,deuxnbre,op);
    writeln('Solution = ',solu);
    separateur;
    generateur;
    writeln(total);
    for i := 1 to 6 do begin
        writeln(i,' : ',nombres[i]);
    end;
    generateur;
    readkey;
end.
