program semaine02exercice01;
	
	(* Devoir Language de programmation nr. 2 
	   24/09/2013 EPHEC T1 classe M1 Youri Mouton *)
		   
uses
	crt;

var	
	prixun:real; // prix unitaire
	qtt:integer; // quantite
	sanstva:real;// prix sans tva
	avectva:real;// prix avec tva
	remise:real; // remise
	taux:real;   // taux de la remise

const   
	tva = 0.06;  // La TVA est de 6%!

procedure terminerprogramme;
begin
	//////////////////////////////////////////////////
	// Fin du programm quand une touche est pressee.//
	//////////////////////////////////////////////////
	writeln;
	writeln('appuyer sur une touche pour terminer ...');
	readkey;
	
end;
	
begin
	////////////////////////////////////////////
	// Debut du programme, affichage du titre.//
	////////////////////////////////////////////
	clrscr;
	writeln('calcul d''une micro-facture');
	writeln('--------------------------');
	
	//////////////////////////////////////////
	// Entree des donnees par l'utilisateur //
	// et verification de positivite.       //
	//////////////////////////////////////////
	write('introduisez le prix unitaire (en euro) : ');
	readln(prixun);
    if (prixun < 0) then begin
        writeln('erreur sur prix unitaire');
        terminerprogramme;
   	end;
   	
    write('introduisez la quantite souhaitee      : ');
	readln(qtt);
	if (qtt < 0) then begin
		writeln('erreur sur quantite');
		terminerprogramme;
		exit;
	end;
	writeln;
	
	////////////////////////////////////////////
	// Calcul du prix total avec et sans taxe.//
	////////////////////////////////////////////
	sanstva := prixun*qtt;
	avectva := (prixun*qtt) + ((prixun*qtt)*tva);
	writeln(qtt, ' articles a ', prixun:0:2, ' euros piece');
	writeln('  ==> prix hors taxe    : ', sanstva:0:2, ' euros');
	writeln('  ==> prix tva comprise : ', avectva:0:2, ' euros');
	
	if (avectva > 200) then begin
		if (avectva > 200) and (avectva < 400) then
			taux   := 0.1;
			remise := avectva*taux;
		if (avectva > 400) then
			taux   := 0.15;
			remise := avectva*taux;
		writeln('  ==> remise (', taux*100:0:0, '%)      : -', remise:0:2, ' euros');
		writeln('  -------------------------------------');
		writeln('  ==> prix a payer      : ', avectva - remise:0:2, ' euros');
	end;
	
	///////////////////////////////////////////////
	// Fin du programme si tout s'est bien passe.//
	///////////////////////////////////////////////
	terminerprogramme; 
end.