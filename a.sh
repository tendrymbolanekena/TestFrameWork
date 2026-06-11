#!/bin/bash

# --- CONFIGURATION STRICTE DES CHEMINS ---
BASE_DIR="/home/nekena/L2/S4/ProgSys/FrameWork"
TEST_DIR="$BASE_DIR/test"
WEBAPP_DIR="$TEST_DIR/webapp"
TOMCAT_WEBAPPS="/opt/lampp/tomcat/webapps"

SERVLET_JAR="/usr/share/java/servlet-api.jar" # Votre API javax
FRAMEWORK_JAR="$BASE_DIR/mon-framework.jar"   # Le JAR généré à la racine de FrameWork
APP_WAR="$TEST_DIR/test.war"

echo "🚀 Déploiement du projet de test depuis le bon dossier..."

# 1. On s'assure que le dossier lib existe dans webapp
mkdir -p "$WEBAPP_DIR/WEB-INF/lib"

# 2. On récupère le framework.jar pour le mettre dans le projet test
if [ -f "$FRAMEWORK_JAR" ]; then
    cp "$FRAMEWORK_JAR" "$WEBAPP_DIR/WEB-INF/lib/"
    echo "✅ mon-framework.jar copié dans webapp/WEB-INF/lib/"
else
    echo "⚠️ Attention : Aucun mon-framework.jar trouvé à la racine de FrameWork."
    echo "Vérifiez s'il est présent ou compilez-le avant de continuer."
fi

# 3. Compilation du code source de test (s'il y a des fichiers .java dans src)
if [ -d "$TEST_DIR/src" ] && [ "$(ls -A "$TEST_DIR/src")" ]; then
    echo "🏗️ Compilation de votre code de test..."
    mkdir -p "$WEBAPP_DIR/WEB-INF/classes"
    javac -cp "$SERVLET_JAR:$WEBAPP_DIR/WEB-INF/lib/mon-framework.jar" -d "$WEBAPP_DIR/WEB-INF/classes" "$TEST_DIR"/src/**/*.java
fi

# 4. Création du fichier .WAR
echo "📦 Création du fichier test.war..."
cd "$WEBAPP_DIR" || exit
jar cvf "$APP_WAR" . > /dev/null

# 5. Déploiement dans Tomcat XAMPP
echo "🔥 Envoi vers /opt/lampp/tomcat/webapps/..."
sudo rm -rf "$TOMCAT_WEBAPPS/test"
sudo rm -f "$TOMCAT_WEBAPPS/test.war"
sudo cp "$APP_WAR" "$TOMCAT_WEBAPPS/"

echo "🎉 Déploiement terminé !"
echo "👉 URL à tester : http://localhost:8080/test/aaaaaaa"