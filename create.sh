# 1. Verzeichnis anlegen und Rechte setzen
sudo mkdir /opt/walkingcows.de
sudo chown -R $(whoami):$(whoami) /opt/walkingcows.de

# 2. Ins Zielverzeichnis wechseln
cd /opt

# 3. Repo klonen (ohne Token in der URL!)
git clone https://github.com/bkluszynski/walkingcows.de.git

# 4. Ins Projektverzeichnis wechseln
cd walkingcows.de

# 5. Container starten
docker compose up -d
