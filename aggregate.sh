# les requêtes ci-après sont pensé pour être éxecuté dans mongoshell

# rassemble les joueurs des 2 équipes dans 1 seul tableau
concatProject = {
    $project: {
        notes: {$concatArrays: ["$notesDomicile", "$notesExterieure"]}
    }
};

# separe le tableau de joueurs en autant de document, pour chaque match
# (héritant des champs du match dont ils sont issus)
unwind = {
    $unwind: "$notes"
};

# rassemble les documents portant sur le même joueur,
# en accumulant le score dans une variable,
# le nombre de documents cumulés correspondant aux nombre de match
cumule = {
    $group: {
        _id: {
            nom: "$notes.nom",
            prenom: "$notes.prenom"
        },
        totalNotes: { $sum: "$notes.note"},
        matchCount: { $sum: 1 },
    }
};

# filtre les joueurs ayant joué au moins X (ici 2) matchs
filtre = {
    $match: {
        matchCount: { $gte: 2 }
    }
};

# mise en forme des documents, calcule de la moyenne
shapeUp = {
    $project: {
        _id: 0,
        nom: "$_id.nom",
        prenom: "$_id.prenom",
        moyenneNotes: { $divide: ["$totalNotes", "$matchCount"] }
    }
};

# création/mise à jour de la collection
output = {
    $out: "joueursAvecMoyenne"
}

#pipeline entière
db.match.aggregate([
    concatProject,
    unwind,
    cumule,
    filtre,
    shapeUp,
	output
]);