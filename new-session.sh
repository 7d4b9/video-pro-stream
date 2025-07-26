
#!/bin/bash

# === CONFIGURATION ===
RECORD_DIR="$HOME/Videos/vegito-recordings"
SESSION_NAME="Vegito"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="${SESSION_NAME}_${DATE}.mkv"

mkdir -p "$RECORD_DIR"

echo "➡️ Lancement de l'enregistrement OBS avec le profil 'vegito-profile'"
echo "📁 Fichier de sortie : $RECORD_DIR/$FILENAME"

# Lancer OBS avec le profil configuré et un chemin de sortie
obs --profile "vegito-profile" --collection "vegito-collection" --startrecording &

echo "✅ OBS lancé. Pense à vérifier la scène et l'entrée micro."