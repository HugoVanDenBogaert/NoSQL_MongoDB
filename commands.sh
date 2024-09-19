# écrire ici les commandes pour respecter les consignes écrites dans le README ou la diapo

# insertion d'une equipe
db.equipe.insertOne(
    {
        nom: "mont st-michel",
        couleur: "gris",
        stade: "mi-shell",
        effectif: [ {
            nom: "michel",
            prenom: "jean",
            dob: "03 janvier 1956",
            taille: 1.60,
            poids: 70,
            poste: "patissier"
        } ]
    }
);

# insertion d'un joueur
db.joueur.insertOne(
    {
        _id: "jghezfifoisdfsfj",
        nom: "michel",
        prenom: "jean",
        dob: "03 janvier 1956",
        taille: 1.60,
        poids: 70,
        poste: "patissier"
    }
);

#insertion d'un match
db.match.insertOne(
    {
        domicile: 
    {
        nom: "mont st-michel",
        couleur: "gris",
        stade: "mi-shell",
        effectif: [ {
            _id: "jghezfifoisdfsfj",
            nom: "michel",
            prenom: "jean",
            dob: "03 janvier 1956",
            taille: 1.60,
            poids: 70,
            poste: "patissier"
        } ]
    },
        exterieure: 
    {
        nom: "mont st-michel",
        couleur: "gris",
        stade: "mi-shell",
        effectif: [ {
            _id: "jghezfifoisdfsfj",
            nom: "michel",
            prenom: "jean",
            dob: "03 janvier 1956",
            taille: 1.60,
            poids: 70,
            poste: "patissier"
        } ]
    },
        competition: "championnat regionnal de bretagne",
        scoreDomicile: 0,
        scoreExterieure: 6,
        noteDomicile: [ {
            _id: "jghezfifoisdfsfj",
            note: 3
        }],
        noteExterieure: [{
            _id: "jghezfifoisdfsfj",
            note: 3
        }]
    }
)