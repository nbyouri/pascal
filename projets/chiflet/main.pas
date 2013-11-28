program main;
uses    crt, petitProjet;
(*var
    vartemp : string;
    premnbre,deuxnbre : integer;
    op : char;
    ch : char;*)
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
