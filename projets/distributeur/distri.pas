program distributeur;

uses 
    crt;

const  
    {prix des boissons} 
    peau = 1; 
    psprite = 1.2;
    pcoca = 1.2;
    pfanta = 1.2;
    porange = 1.5;

var 
    {compteur de boissons}
    eau,sprite,coca,fanta,orange:integer;
    {prix et prix total}
    prix,total : real;
    {choix de la boisson}
    choix : integer;
    {etat de marche}
    marche : boolean;
    quitter : integer;
    stocktotal : integer;
    {variable temporaire pour test}
    vartemp : string;

function checkerreur(vartemp:string) : integer;
(* Securiser l'input. *)
var
    int,erreur:integer;
begin
    val(vartemp,int,erreur);
    while (erreur > 0) do begin
        write('Entrer une valeur entiere! : ');
        readln(vartemp);
        val(vartemp,int,erreur);
    end;
    checkerreur := int;
end;

procedure paneauprincipal;
begin
    writeln('+---------------------------+');
    writeln('|Distributeur de boissons   |');
    writeln('|Prix en euros, stock limite|');
    writeln('+-------+----------+--------+');
    writeln('| 1.Eau | 2.Sprite | 3.Coca |');
    writeln('|  €1   |   €1,2   |  €1,2  |');
    writeln('+-------+-+--------+--------+');
    writeln('| 4.Fanta | 5.Jus d''orange  |');
    writeln('|  €1,2   |      €1,5       |');
    writeln('+---------+-----------------+');
    writeln('|        Disponible         |');
    writeln('| Eau           : ', eau:2, '--------|');
    writeln('| Sprite        : ', sprite:2, '--------|');
    writeln('| Coca          : ', coca:2, '--------|');
    writeln('| Fanta         : ', fanta:2, '--------|');
    writeln('| Just d''orange : ', orange:2, '--------|');
    writeln('+---------------------------+');
    write('|-Choisir une boisson: '); 
    readln(vartemp);
    choix := checkerreur(vartemp);
end;

procedure checkstock;
begin
    (* Verification des stock *)
    if choix = 0 then begin
        writeln('<-- Stock epuise, appuyer sur une touche -->');
        readkey; 
    end; 
end;

procedure miseajourstock;
begin
    (* Mise a jour des stock *)
    case choix of
        1 : begin 
            choix := eau; checkstock;
            if choix > 0 then begin 
                eau := eau - 1; 
                prix := prix + peau; 
            end; end;
        2 : begin 
            choix := sprite; checkstock; 
            if choix > 0 then begin
                sprite := sprite - 1; 
                prix := prix + psprite;
            end; end;
        3 : begin 
            choix := coca; checkstock;
            if choix > 0 then begin 
                coca := coca - 1; 
                prix := prix + pcoca;
            end; end;
        4 : begin 
            choix := fanta; checkstock;
            if choix > 0 then begin 
                fanta := fanta - 1; 
                prix := prix + pfanta;
            end; end;
        5 : begin 
            choix := orange; checkstock;
            if choix > 0 then begin
                orange := orange - 1; 
                prix := prix + porange;
            end; end;
        else
            begin 
                writeln('<-- Choix invalide, appuyer sur une touche -->'); 
                readkey;
            end;
    end;
end;

procedure fin;
(* Message de fin a affichage du prix 
   On quitte si le stock de boissons 
   est epuise. *)
begin
    (* Mise a jour de la totalite des gains *)
    (* afficher quand? *)
    total := total + prix;

    stocktotal := eau + sprite + coca + fanta + orange;
    if stocktotal = 0 then begin
        writeln('stock de boissons epuise, le programme s''arrete...');
        marche := true;
        writeln;
        writeln;
        writeln('Prix a payer : ', prix:0:2); marche := false;
    end else begin
    writeln('Continuer ? Entrer 1 pour quitter,');
    write('ou entrer une autre valeur et Continuer : ');
    readln(vartemp);
    quitter := checkerreur(vartemp);
    case quitter of 
        1 : begin 
                writeln;
                writeln;
                writeln('Prix a payer : ', prix:0:2); marche := false;
            end;
        2 : marche := true;
    end;
    end;
end;

begin
    (* Definition des stock *)
    eau    := 10;
    sprite := 10;
    coca   := 10;
    fanta  := 10;
    orange := 10;
    (* Initialisation de variables *)
    prix   := 0;
    total  := 0;
    marche := true;
    (* Boucle principale manquante, gérer plusieurs clients *)
    (* Boucle clients *)
    while marche do begin 
    (* Fonction graphique *)
    clrscr;
    (* Affichage paneau principal *)
    paneauprincipal;
    (* Mise a jour des stock de boissons et calcul du prix *)
    miseajourstock;
    (* Fin et affichage paiement *)
    fin;
    (* Fin boucle principale *)
    end; 
end.
