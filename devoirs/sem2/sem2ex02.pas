program semaine02exercice02;
		
	(* Devoir Language de programmation nr. 3
	   24/09/2013 EPHEC T1 classe M1 Youri Mouton *)
	   	   
uses
	crt;
	
var
	annee:integer;
	
begin
	/////////////////////////////////////////////
	// Debut du programme, affichage du titre. //
	/////////////////////////////////////////////
	clrscr;
	writeln('determination caractere bissextile');
	writeln('----------------------------------');
	
	/////////////////////////////////////////
	// Entree et verification des donnees. //
	/////////////////////////////////////////
	write('quelle annee vous interesse (entre 1600 et 3000) : ');
	readln(annee);
	if (annee <= 1600) or (annee >= 3000) then 
	begin
		writeln;
		writeln('erreur de saisie ... fin du programme !');
	end
	
	/////////////////////////////////////////////////
	// Calcul de si l'annee est bissextile ou non. //
	/////////////////////////////////////////////////
	else if (annee mod 4 = 0) and (annee mod 100 <> 0) then begin
		writeln;
		writeln(annee, ' est bissextile');
	end
	else if (annee mod 400 = 0) then begin
		writeln;
		writeln(annee, ' est bissextile');
	end
	else begin 
		writeln;
		writeln(annee, ' n''est pas bissextile');
	end;
	
	//////////////////////////////////////////////////
	// Fin du programm quand une touche est pressee.//
	//////////////////////////////////////////////////
	writeln;
	writeln;
	writeln('appuyer sur une touche pour terminer ...');
	readkey;
	
end.