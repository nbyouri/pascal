program semaine01exercice01;
	
	(* Devoir Language de programmation nr. 1 
	   21/09/2013 EPHEC T1 classe M1 Youri Mouton *)
		   
uses	crt;

var	prixun:real; // prixun = prix unitaire
	qtt:integer; // qtt = quantite

const   tva = 0.21;  // La TVA est de 21%!

begin
	////////////////////////////////////////////
	// Debut du programme, affichage du titre.//
	////////////////////////////////////////////
	
	clrscr;
	writeln('calcul d''une micro-facture');
	writeln('--------------------------');
	
	//////////////////////////////////////////
	// Entree des donnees par l'utilisateur.//
	//////////////////////////////////////////
	
	write('introduisez le prix unitaire (en euro) : ');
	readln(prixun);
	write('introduisez la quantite souhaitee      : ');
	readln(qtt);
	writeln;
	
	////////////////////////////////////////////
	// Calcul du prix total avec et sans taxe.//
	////////////////////////////////////////////
	
	writeln(qtt, ' articles a ', prixun:0:2, ' euros piece');
	writeln('  ==> prix hors taxe    : ', prixun*qtt:0:2, ' euros');
	writeln('  ==> prix tva comprise : ', (prixun*qtt) + ((prixun*qtt)*tva):0:2, ' euros');
	
	//////////////////////////////////////////////////
	// Fin du programm quand une touche est pressee.//
	//////////////////////////////////////////////////
	
	writeln;
	writeln('appuyer sur une touche pour terminer ...');
	readkey;
end.