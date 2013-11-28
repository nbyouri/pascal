program main;

uses    crt, petitProjet;

begin
    write('entrer premier nombre : ');  readln(vartemp);
    premnbre := checkerreur(vartemp);
    write('entrer operateur : '); readln(op);
    write('entrer deuxiemme nombre : '); readln(vartemp);
    deuxnbre := checkerreur(vartemp);
    verification;
    ch := '-';
    separateur(ch);
    readkey;
end.
