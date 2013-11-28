program babysit;

uses crt;

const
    { Semaine }
    tranche1 = 7;  { entre 17h et 21h59 }
    tranche2 = 9;  { entre 22h et 23h59 }
    tranche3 = 12; { apres minuit }
    { Samedi }
    samtranche1 = 8;
    samtranche2 = 10;
    samtranche3 = 12;
    { Dimanche }
    tarifdim = 1.5;{ 150% du tarif semaine }
    { General }
    fintran1 = 22; { fin tranche 1 }
    hdebut   = 20; { commence avant 20h! }
    hdebmin  = 17; { heure debut minimum }
    lundi    = 1;  { jours entre 1 et 7 }
    mardi    = 2;
    mercredi = 3;
    jeudi    = 4;
    vendredi = 5;
    samedi   = 6;
    dimanche = 7;
    hmin     = 0;  { heures entre 0 et 23 }
    hmax     = 23;
    mmin     = 0;  { minutes entre 0 et 59 }
    mmax     = 59;

var
    jour,heuredebut,heurefin,minutefin,tranche,
    salairedimanche,salairesamedi,salairesemaine,
    salairetotal,heurestotal : integer;
    continuer,averifier : boolean;
    vartemp : string;
    choix : char;

function checkerreur(vartemp:string) : integer;
{ cette fonction valide le format de l'input }
var
    int,erreur:integer;
begin
    val(vartemp,int,erreur);
    while (erreur <> 0) do begin
    write('Entrer valeur entiere : ');
    readln(vartemp);
    val(vartemp,int,erreur);
    end;
    checkerreur := int;
end;

procedure total;
begin
    writeln;
    writeln('+-----------------------------------+');
    writeln('|    Salaire total :   ',salairetotal:3,' euros    |');
    writeln('+-----------------------------------+');
    writeln;
end;

procedure calcul;
begin
    { TODO: retirer non constantes }
    if not averifier then begin
        { calcul du salaire de samaine }
        if (jour >= lundi) and (jour < samedi) then begin
            heurestotal := heurefin - heuredebut;
            { calcul salaire premiere tranche }
            if (heuredebut >= hdebmin) and (heurefin < fintran1) then begin
                if (minutefin > mmin) then
                    heurestotal := heurestotal + 1;
                salairesemaine := salairesemaine + (heurestotal * tranche1);
            end;
        end;
        salairetotal := salairesemaine + salairesamedi + salairedimanche;
    end;
end;

procedure validation;
begin
    averifier := false;
    if (jour < lundi) or (jour > dimanche) then begin
        writeln('Jour de la semaine fausse! ex. mardi = 2.');
        averifier := true;
    end; if (heurefin <= heuredebut) then begin
        writeln('l''heure de fin est toujours apres l''heure de debut!');
        averifier := true;
    end; if (heuredebut >= hdebut) or (heuredebut < hdebmin) then begin
        writeln('l''heure de debut est avant ',hdebut,' et apres ',hdebmin);
        averifier := true;
    end; if (minutefin < mmin) or (minutefin > mmax) then begin
        writeln('Minues entrees fausses! Entre 0 et 59');
        averifier := true;
    end; if (heurefin < hmin) or (heurefin > hmax) then begin
        writeln('Heure de fin fausse! Entre 1 et 24');
        averifier := true;
    end;
end;

procedure accueil;
begin
    writeln('+-----------------------------------+');
    writeln('|        Facture Babysitting        |');
    writeln('+-----------------------------------+');
    writeln('|      Lundi = 1, Dimanche = 7      |');
    writeln('+-----------------------------------+');
    writeln;
    write('  => Jour ?           : ');
    readln(vartemp);
    jour := checkerreur(vartemp);
    write('  => Heure de debut ? : ');
    readln(vartemp);
    heuredebut := checkerreur(vartemp);
    write('  => Heure de fin ?   : ');
    readln(vartemp);
    heurefin := checkerreur(vartemp);
    write('  => Minute de fin ?  : ');
    readln(vartemp);
    minutefin := checkerreur(vartemp);
    writeln;
end;

procedure fin;
begin
    writeln('+-----------------------------------+');
    writeln('| Continuer ou arreter et afficher  |');
    writeln('| les honoraires de la babysitter?  |');
    writeln('+-----------------------------------+');
    write('  => (o/n) : '); readln(choix);
    case choix of
    'n','N' : begin continuer := false; total; end; { affichage du total }
    'o','O' : begin continuer := true; averifier := true; end
    else begin write('  => (o/n) : '); readln(choix); end;
end;
end;

begin       { fonction principale }
    { initialisation de variables }
    continuer := true;
    averifier := true;
    salairetotal := 0;
    while continuer do begin{ boucle principale }
    clrscr;                 { fonction graphique }
    while averifier do begin{ boucle d'entree de donnees }
    accueil;                { affichage ecran accueil }
    validation;             { verification des donnees entrees }
    calcul;                 { calcul salaire si pas d'erreur }
    end;                    { fin boucle principale }
    fin;                    { message de fin }
    end;                    { fin boucle principale }
    writeln('+-----------------------------------+');
    writeln('|Appuyer sur une touche pour quitter|');
    writeln('+-----------------------------------+');
    //readkey;
end.
