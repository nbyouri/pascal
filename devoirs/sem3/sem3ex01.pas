{ Programme pascal ephec sem3e1 }

program commandevin;

uses    crt;

const 
        pchamp = 12.5;
        prouge = 8.7;
        pblanc = 6.25;
        plivchamp = 3;
        plivvin = 0.35;
        tva = 1.21;
        pcautionchamp = 0.15;
        pcautionrouge = 0.12;
        pcautionblanc = 0.10;
        carton1 = 18;
        carton2 = 12;
        carton3 = 6;

var
        qttchamp,qttrouge,qttblanc,carton18,carton12,carton6,cartons : integer;
        ptotalchamp,plivtotalchamp,livreduction,totalcautions,
        ptotalrouge,ptotalblanc,plivtotalvin,ptotalvin,cauchamp,caurouge,caublanc : real;
        livrer : char;
        erreur : boolean;
begin
        { Message depart }
        writeln('command de vins et champagne');
        writeln('----------------------------');
        writeln;
        writeln('combien de bouteilles commandez-vous ?');
        writeln;
        write('  => champagne (par 6 bout.) a ',pchamp:2:2,' euro : ');
        readln(qttchamp);
        write('  => vin rouge (a la piece)  a  ',prouge:2:2,' euro : ');
        readln(qttrouge);
        write('  => vin blanc (a la piece)  a  ',pblanc:2:2,' euro : ');
        readln(qttblanc);
        writeln;
        write('faut il effectuer la livraison ? (o/n) : ');
        readln(livrer);
        writeln;
        writeln('------------------------------------------------');
        writeln;
        
        erreur := false;
        if (qttchamp < 0) or (qttrouge < 0) or  (qttblanc < 0) then begin
            erreur := true;
            writeln('Erreur dans la commande!');
        end;
        if (qttchamp + qttrouge + qttblanc = 0) then begin
            erreur := true;
            writeln('Aucune commande effectuee!');
        end;
        if not (livrer in ['o','O', 'n', 'N']) then begin
            erreur := true;
            writeln('Valeur entree pour la livraison incorrecte!');
        end;
        if (qttchamp mod 6 <> 0) then begin
            erreur := true;
            writeln('le nombre de bouteilles de champagne n''est pas un multiple de 6!');
        end;

        if not erreur then begin
            {calcul repartition bouteilles champagnes dans cartons}
            carton18 := qttchamp div carton1;
            carton12 := (qttchamp mod carton1) div carton2;
            carton6  := ((qttchamp mod carton1) mod carton2) div carton3;
            cartons  := carton18 + carton12 + carton6;
            ptotalchamp := qttchamp * pchamp;
            writeln('votre livraison : ');
            { calcul prix bouteilles champagne }
            writeln('  champagne : ',qttchamp, ' bouteilles x ', pchamp:5:2, ' =  ', ptotalchamp:8:2);
            writeln('                  ',carton18:2, ' carton(s) de 18b.');
            writeln('                  ',carton12:2,' carton(s) de 12b.');
            writeln('                  ',carton6:2,' cartons(s) de 6b.');
            if livrer in ['O', 'o'] then begin
                livreduction := 0;
                plivtotalchamp := cartons * plivchamp;
                writeln('      livraison champ ..................  ',plivtotalchamp:6:2);
                if cartons > 4 then begin
                    {??}
                    livreduction := 3 * plivchamp;
                    plivtotalchamp := plivtotalchamp - livreduction;
                    writeln('      reduction champ .................. -',plivtotalchamp:6:2);
                end;
                ptotalchamp := ptotalchamp + livreduction;
            end;
            writeln('                           prix htva :  ', ptotalchamp:8:2);
            writeln('                          ----------------------');  
            writeln('                           prix tvaC :  ', (ptotalchamp * tva):8:2);
            { prix bouteilles vin }
            writeln;
            ptotalrouge := qttrouge * prouge;
            ptotalblanc := qttblanc * pblanc;
            writeln('  vin rouge : ',qttrouge, ' bouteilles x  ', prouge:0:2, ' =  ', ptotalrouge:5:2);
            writeln('  vin blanc : ',qttblanc, ' bouteilles x  ', pblanc:0:2, ' =  ', ptotalblanc:5:2);
            if livrer in ['O', 'o'] then begin
                livreduction := 0;
                plivtotalvin := (qttrouge+qttblanc) * plivvin;
                writeln('     livraison vins .................... ',plivtotalvin:6:2);
                if (qttrouge+qttblanc) > 100 then begin
                    livreduction := 40 * plivvin;
                    writeln('     reduction vins .................... -',livreduction:6:2);
                end;
            end;
                ptotalvin := ptotalrouge + ptotalblanc + plivtotalvin - livreduction;
            writeln('                           prix htva :  ', ptotalvin:8:2);
            writeln('                          ----------------------');  
            writeln('                           prix tvaC :  ', (ptotalvin * tva):8:2);
            writeln;
            { calcul prix des cautions }
            cauchamp := qttchamp * pcautionchamp;
            caurouge := qttrouge * pcautionrouge;
            caublanc := qttblanc * pcautionblanc;
            totalcautions := cauchamp + caurouge + caublanc;
            writeln('  caution champagne ..................... ', cauchamp:5:2);
            writeln('          vin rouge ..................... ', caurouge:5:2);
            writeln('          vin blanc ..................... ', caublanc:5:2);
            writeln;
            writeln(' TOTAL A PAYER ........................ ', (((ptotalvin+ptotalchamp)*tva)+totalcautions):8:2);
        end;
        {fin du programme}
        writeln;
        writeln('------------------------------------------------');
        writeln;
        write('appuyer sur une touche pour terminer ...');
        readkey;
end.
