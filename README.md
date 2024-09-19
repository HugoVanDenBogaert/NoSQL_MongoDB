Modelisation à faire (dans mongdb):

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

Mettre en place le nécessaire pour optimiser les requêtes:

    - d'équipe, par nom
    - de joueur, par nom

Exprimer les requêtes de:

    - selection de JOUEUR pour un POSTE donné, et un AGE max
    (exemple: arrière droit de moins de 25 ans)
    - d'insertion d'équipes
    - d'insertion de joueurs
    - d'insertion de matchs

Construire une nouvelle collection stockant les JOUEUR ayant:

    - joué au moins X (par exemple 3) matchs
    - avec la moyenne de ses notes

à livrer:

    - scripts mongodb avec commentaires de DEFINITION et de MANIPULATION des données

Participants:

    Clément VORMS
    Hugo VAN DEN BOGAERT