# les requêtes ci-après sont pensé pour être éxecuté dans mongoshell

# Insertion de joueurs
db.joueur.insertMany([
    {
        nom: "Michel",
        prenom: "Jean",
        dob: new Date("1956-01-03"),
        taille: 1.60,
        poids: 70,
        poste: "patissier"
    },
    {
        nom: "Debrac",
        prenom: "Pierre",
        dob: new Date("1998-06-15"),
        taille: 1.75,
        poids: 80,
        poste: "arrière droit"
    },
    {
        nom: "Lefevre",
        prenom: "Jacques",
        dob: new Date("1992-11-15"),
        taille: 1.78,
        poids: 75,
        poste: "milieu"
    },
    {
        nom: "Martin",
        prenom: "Louis",
        dob: new Date("1995-02-25"),
        taille: 1.90,
        poids: 85,
        poste: "attaquant"
    }
]);


# insertion d'une equipe
db.equipe.insertMany([
    {
        nom: "mont st-michel angels",
        couleur: "gris",
        stade: "mi-shell",
        effectif: [
		    {
        nom: "Michel",
        prenom: "Jean",
        dob: new Date("1956-01-03"),
        taille: 1.60,
        poids: 70,
        poste: "patissier"
    },
    {
        nom: "Debrac",
        prenom: "Pierre",
        dob: new Date("1998-06-15"),
        taille: 1.75,
        poids: 80,
        poste: "arrière droit"
    }]
    },
    {
        nom: "st-malo pirates",
        couleur: "bleu",
        stade: "corsair",
        effectif: [
		    {
        nom: "Lefevre",
        prenom: "Jacques",
        dob: new Date("1992-11-15"),
        taille: 1.78,
        poids: 75,
        poste: "milieu"
    },
    {
        nom: "Martin",
        prenom: "Louis",
        dob: new Date("1995-02-25"),
        taille: 1.90,
        poids: 85,
        poste: "attaquant"
    }]
    }
]);

# Insertion de matchs
db.match.insertMany([
    {
        domicile: "Mont St-Michel",
        exterieure: "St-Malo Pirates",
        competition: "Championnat Breizh vs Normandie",
        scoreDomicile: 2,
        scoreExterieure: 3,
        notesDomicile: [
            { nom: "Michel", prenom: "Jean", note: 7 },
            { nom: "Debrac", prenom: "Pierre", note: 6 }
        ],
        notesExterieure: [
            { nom: "Lefevre", prenom: "Jacques", note: 8 },
            { nom: "Martin", prenom: "Louis", note: 9 }
        ]
    },
    {
        domicile: "St-Malo Pirates",
        exterieure: "Mont St-Michel",
        competition: "Championnat Breizh vs Normandie",
        scoreDomicile: 1,
        scoreExterieure: 1,
        notesDomicile: [
            { nom: "Lefevre", prenom: "Jacques", note: 6 },
            { nom: "Martin", prenom: "Louis", note: 5 }
        ],
        notesExterieure: [
            { nom: "Michel", prenom: "Jean", note: 7 },
            { nom: "Debrac", prenom: "Pierre", note: 6 }
        ]
    }
]);