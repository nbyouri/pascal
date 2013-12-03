program main;

uses    crt, youri, tom;

var i : integer;

begin
    erreur := false;
    initjoueurs;
    generateur;
    plateau;
    initjeu;
    calcul(premnbre,deuxnbre,op);
    readkey;
end.
