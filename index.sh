# les requêtes ci-après sont pensé pour être éxecuté dans mongoshell

# pour optimiser les requêtes d'équipes par nom
db.equipe.createIndex({ nom: 1 });
# pour optimiser les requêtes de joueurs par nom
db.joueur.createIndex({ nom: 1 });
# le nom de famille semble être suffisament discriminant
# pour ne pas indexer le prénom en plus.
# la commande serait:
# db.joueur.createIndex({ nom: 1, prenom: 2 });