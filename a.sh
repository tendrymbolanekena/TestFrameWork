
#!/bin/bash

# Configuration des chemins
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
TEST_DIR="$BASE_DIR"
WEBAPP_DIR="$TEST_DIR/webapp"
TOMCAT_WEBAPPS="/opt/lampp/tomcat/webapps"

FRAMEWORK_JAR="$WEBAPP_DIR/WEB-INF/lib/sprint8.jar"
GSON_JAR="$BASE_DIR/../FrameWork/src/lib/gson-2.13.1.jar"
APP_WAR="$TEST_DIR/test.war"

echo "Déploiement du projet TestFrameWork..."

# 1. Vérifier le JAR
if [ ! -f "$FRAMEWORK_JAR" ]; then
    echo "Erreur : JAR introuvable : $FRAMEWORK_JAR"
    exit 1
fi

# Gson est utilisé par le framework pour sérialiser les réponses JSON.
if [ ! -f "$GSON_JAR" ]; then
    echo "Erreur : JAR Gson introuvable : $GSON_JAR"
    exit 1
fi
cp "$GSON_JAR" "$WEBAPP_DIR/WEB-INF/lib/"

# 2. Créer le dossier des classes
mkdir -p "$WEBAPP_DIR/WEB-INF/classes"

# 3. Compiler les contrôleurs de test
echo "Compilation des contrôleurs..."

javac -cp "$FRAMEWORK_JAR" \
      -d "$WEBAPP_DIR/WEB-INF/classes" \
      "$TEST_DIR"/src/java/*/*.java

if [ $? -ne 0 ]; then
    echo "Erreur de compilation !"
    exit 1
fi

# 4. Créer le WAR
echo "Création de test.war..."

cd "$WEBAPP_DIR" || exit 1
jar cvf "$APP_WAR" . > /dev/null
cd "$TEST_DIR" || exit 1

if [ ! -f "$APP_WAR" ]; then
    echo "Erreur : test.war n'a pas été créé."
    exit 1
fi

# 5. Déployer dans Tomcat
echo "Déploiement dans $TOMCAT_WEBAPPS..."

sudo rm -rf "$TOMCAT_WEBAPPS/test"
sudo rm -f "$TOMCAT_WEBAPPS/test.war"
sudo cp "$APP_WAR" "$TOMCAT_WEBAPPS/test.war"

echo "Déploiement terminé !"
echo "URL : http://localhost:8080/test/"

# 6. Suivre les logs
tail -f /opt/lampp/tomcat/logs/catalina.out
