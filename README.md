Dans les fichiers .sh se trouvent:

La modelisation à faire dans mongdb (dans le fichier insertion.sh):

    - Equipe
        - nom
        - couleur
        - stade
        - effectif (liste de joueurs)

    - Joueur
        - nom
        - prénom
        - date de naissance
        - taille
        - poids
        - poste

    - match
        - équipe "domicile"
        - équipe "extérieure"
        - compétition
        - score domicile
        - score extérieure
        - joueurs domiciles, avec chacun sa note
        - joueurs extérieure, avec chacun sa note

Le nécessaire pour optimiser les requêtes (dans le fichier index.sh):

    - d'équipe, par nom
    - de joueur, par nom

Des requêtes de:

    - selection de JOUEUR pour un POSTE donné, et un AGE max
    (dans le fichier selection.sh)
    - d'insertion d'équipes
    - d'insertion de joueurs
    - d'insertion de matchs
    (dans le fichier insertion.sh)

Une requête (dans le fichier aggregate.sh) pour construire une nouvelle collection stockant les JOUEUR ayant:

    - joué au moins X (par exemple 3) matchs
    - avec la moyenne de ses notes

Participants:

    Clément VORMS
    Hugo VAN DEN BOGAERT