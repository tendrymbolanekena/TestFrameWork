#!/bin/bash

# --- CONFIGURATION STRICTE DES CHEMINS ---
BASE_DIR="/home/itu/Music/NEKENA/S4/WEBdinamique/TestFrameWork"
TEST_DIR="$BASE_DIR"
WEBAPP_DIR="$TEST_DIR/webapp"
TOMCAT_WEBAPPS="/opt/lampp/apache-tomcat-10.0.16/webapps"

# Mise à jour pour le Sprint 1
FRAMEWORK_JAR="$WEBAPP_DIR/WEB-INF/lib/sprint2.jar"   
APP_WAR="$TEST_DIR/test.war"

echo "🚀 Déploiement du projet de test depuis le bon dossier..."

# 1. On s'assure que le dossier lib existe dans webapp
mkdir -p "$WEBAPP_DIR/WEB-INF/lib"

# 2. Vérification de la présence du framework
if [ -f "$FRAMEWORK_JAR" ]; then
    echo "✅ sprint2.jar est bien présent dans webapp/WEB-INF/lib/"
else
    echo "⚠️ Attention : Aucun sprint2.jar trouvé dans webapp/WEB-INF/lib/"
    echo "Vérifiez s'il est présent ou copiez-le avant de continuer."
    exit 1
fi

# 3. Compilation du code source de test (cible src/java)
if [ -d "$TEST_DIR/src/java" ]; then
    echo "🏗️ Compilation de vos contrôleurs de test..."
    mkdir -p "$WEBAPP_DIR/WEB-INF/classes"
    
    # Compilation en ciblant le bon dossier de controllers et le bon JAR
    javac -cp "$FRAMEWORK_JAR" -d "$WEBAPP_DIR/WEB-INF/classes" "$TEST_DIR"/src/java/controller/*.java
    
    if [ $? -ne 0 ]; then
        echo "❌ Erreur de compilation !"
        exit 1
    fi
fi

# 4. Création du fichier .WAR
echo "📦 Création du fichier test.war..."
cd "$WEBAPP_DIR" || exit
jar cvf "$APP_WAR" . > /dev/null
cd "$TEST_DIR" || exit

# 5. Déploiement dans Tomcat XAMPP
echo "🔥 Envoi vers /opt/lampp/apache-tomcat-10.0.16/webapps..."
sudo rm -rf "$TOMCAT_WEBAPPS/test"
sudo rm -f "$TOMCAP_WEBAPPS/test.war"
sudo cp "$APP_WAR" "$TOMCAT_WEBAPPS/"

echo "🎉 Déploiement terminé !"
echo "👉 URL à tester : http://localhost:8080/test/aaaaaaa"