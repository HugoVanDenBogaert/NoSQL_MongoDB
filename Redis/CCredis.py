import redis
import time

r = redis.Redis(host='localhost', port=6379, db=0)

# Ajouter un opérateur
def add_operator(operateur_id, nom, prenom):
    r.hmset(f"operator:{operateur_id}", {"nom": nom, "prenom": prenom, "statut": "disponible"})
    print(f"Opérateur {nom} {prenom} ajouté avec ID {operateur_id}.")

# Ajouter un appel
def add_call(call_id, heure_d_appel, numero_d_origine, description):
    r.hmset(f"call:{call_id}", {
        "heure_d_appel": heure_d_appel,
        "numero_d_origine": numero_d_origine,
        "statut": "Non affecté",
        "duree": "0",
        "operateur": "non",
        "description": description
    })
    r.lpush("call_queue", call_id)
    print(f"Appel {call_id} ajouté et en attente.")

# Affecter un appel à un opérateur disponible
def assign_call_to_operator():
    call_id = r.rpop("call_queue")
    if call_id:
        # Trouver un opérateur disponible
        for key in r.scan_iter("operator:*"):
            operateur = r.hgetall(key)
            if operateur[b"statut"] == b"disponible":
                r.hset(f"call:{call_id.decode('utf-8')}", "statut", "En cours")
                r.hset(f"call:{call_id.decode('utf-8')}", "operateur", key.decode("utf-8").split(":")[1])
                r.hset(key.decode("utf-8"), "statut", "occupé")
                print(f"Appel {call_id.decode('utf-8')} assigné à {operateur[b'nom'].decode('utf-8')} {operateur[b'prenom'].decode('utf-8')}.")
                return
        print("Aucun opérateur disponible.")
    else:
        print("Aucun appel en attente.")

# Terminer un appel
def end_call(call_id, duree):
    operateur_id = r.hget(f"call:{call_id}", "operateur")
    if operateur_id and operateur_id != b"non":
        r.hset(f"call:{call_id}", "statut", "Terminé")
        r.hset(f"call:{call_id}", "duree", duree)
        r.hset(f"operator:{operateur_id.decode('utf-8')}", "statut", "disponible")
        print(f"Appel {call_id} terminé après {duree} secondes.")
    else:
        print(f"Appel {call_id} non trouvé ou non assigné.")


"""
add_operator(1, "Gilbert", "Montyagnier")
add_call(1001, "2024-10-03 10:30:00", "+33 351483773", "Probleme pour lire le mdp")
time.sleep(1)  # délai
assign_call_to_operator()
time.sleep(10)  # Simule la durée de l'appel
end_call(1001, "120")  # Terminer l'appel après 120 secondes
"""

def create_operators():
    add_operator(1, "Gilbert", "Montyagnier")
    add_operator(2, "Martin", "Gal")
    add_operator(3, "Durand", "Lakt")


def create_calls():
    add_call(1001, "2024-10-03 10:30:00", "+33123456789", "Probleme pour lire le mdp")
    time.sleep(3)  

    add_call(1002, "2024-10-03 10:35:00", "+33612345678", "Demande d'information")
    time.sleep(2) 

    add_call(1003, "2024-10-03 10:40:00", "+33798765432", "Problème de facturation")
    time.sleep(1)

    add_call(1004, "2024-10-03 10:45:00", "+33123456789", "Réclamation produit")
    time.sleep(2)

def simulate_call_center():
    assign_call_to_operator()
    time.sleep(4) 

    assign_call_to_operator()
    time.sleep(5)

    assign_call_to_operator()
    time.sleep(3)

    assign_call_to_operator() 
    end_call(1001, "240")  
    time.sleep(2)

    end_call(1002, "300") 
    time.sleep(1)

    end_call(1003, "180") 
    time.sleep(1)

    end_call(1004, "120") 

create_operators()
create_calls()
simulate_call_center()