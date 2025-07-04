#!/bin/bash

# Chemin vers le dossier webapps Tomcat
WEBAPPS_DIR="/home/mandaniaina/Documents/L2/web/tomcat-10/webapps"

# Nom du fichier WAR généré
WAR_NAME="library-Spring-MVC.war"

echo "Suppression de $WEBAPPS_DIR/$WAR_NAME..."
if [ -f "$WEBAPPS_DIR/$WAR_NAME" ]; then
    rm -f "$WEBAPPS_DIR/$WAR_NAME"
else
    echo "Aucun fichier $WAR_NAME trouvé à supprimer."
fi

echo "Suppression du dossier $WEBAPPS_DIR/library-Spring-MVC..."
if [ -d "$WEBAPPS_DIR/library-Spring-MVC" ]; then
    rm -rf "$WEBAPPS_DIR/library-Spring-MVC"
else
    echo "Aucun dossier library-Spring-MVC trouvé à supprimer."
fi

# Vérifie si le war a bien été généré
if [ -f "target/$WAR_NAME" ]; then
    echo "Copie de target/$WAR_NAME vers $WEBAPPS_DIR..."
    cp "target/$WAR_NAME" "$WEBAPPS_DIR"
    echo "Déploiement terminé."
else
    echo "Fichier target/$WAR_NAME non trouvé, compilation échouée ?"
fi
