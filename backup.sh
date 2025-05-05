#!/bin/bash

# Défintion des varibales 

SOURCE="/mnt/c/Users/user/Desktop/SRC"
DESTINATION="/mnt/c/Users/user/Desktop/DEST"
LOG_FILE="/mnt/c/Users/user/Desktop/SAUVE.log"
DATE=$(date +"%Y-%m-%d_%H:%M:%S")

# Vérifier si le dossier SOURCE existe

if [ ! -d "$SOURCE" ]; then
	echo "ERREUR: Le dossier SOURCE à télécharger n'existe pas" >> "$LOG_FILE"
	exit 1
fi

# Création du dossier de destination final

DESTINATION_FINAL="$DESTINATION/sauvegarde_$DATE"
mkdir -p "$DESTINATION_FINAL"

# Lancer la commande de sauvegarde

echo "....Début de la sauvegarde de $SOURCE vers $DESTINATION_FINAL à la date du $DATE" >> "$LOG_FILE"
rsync -av --delete "$SOURCE/" "$DESTINATION_FINAL" >> "$LOG_FILE" 2>&1

# Vérification : Si la commande rsync à reuissi

if [ $? -eq 0 ]; then
	echo "La sauvegarde à la date du $DATE du dossier $SOOURCE vers $DESTINATION_FINAL à reuissi" >> "$LOG_FILE"
else
	echo "La sauvegarde à la date du $DATE du dossier $SOURCE vers $DESTINATION_FINAL à echouée" >> "$LOG_FILE"
fi
