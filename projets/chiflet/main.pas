program main;

uses    crt, youri, tom;

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
    readkey;
end.
