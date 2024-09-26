# les requêtes ci-après sont penser pour être éxecuté dans mongoshell

# age maximal du joueur recherché
let age = 35;

# date de naissance correspondante
maxDob = new Date();
maxDob.setFullYear(maxDob.getFullYear() - age);

# poste du joueur recherché
let poste = "arrière droit";

# requête pour trouver les joueurs correspondants aux critères définits plus haut
db.joueur.find({
  	poste: poste,
    dob: { $gte: maxDob } 
});