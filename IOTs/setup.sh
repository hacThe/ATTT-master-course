DOCKER COMPOSE FOR

#!/usr/bin/env bash
set -e

echo "🚀 Setting up n8n + PostgreSQL + MQTT stack..."

# Base directory
BASE_DIR="$HOME/ATTT/IOTs/stack"

# Create directories
echo "📁 Creating directories..."
mkdir -p "$BASE_DIR/mqtt/config" "$BASE_DIR/mqtt/data" "$BASE_DIR/mqtt/log"
mkdir -p "$BASE_DIR/n8n_data"

cd "$BASE_DIR"

# Create Mosquitto config
echo "📝 Writing Mosquitto config..."
cat > mqtt/config/mosquitto.conf << 'EOF'
persistence true
persistence_location /mosquitto/data/

log_dest file /mosquitto/log/mosquitto.log

listener 1883
allow_anonymous true
EOF

# Create docker-compose.yml
echo "📝 Writing docker-compose.yml..."
cat > docker-compose.yml << 'EOF'
services:
  postgres:
    image: postgres:15
    restart: always
    environment:
      POSTGRES_USER: n8n
      POSTGRES_PASSWORD: n8npassword
      POSTGRES_DB: n8n
    volumes:
      - postgres_data:/var/lib/postgresql/data

  mqtt:
    image: eclipse-mosquitto:2
    container_name: mqtt
    restart: always
    ports:
      - "1883:1883"
    volumes:
      - ./mqtt/config:/mosquitto/config
      - ./mqtt/data:/mosquitto/data
      - ./mqtt/log:/mosquitto/log

  n8n:
    image: n8nio/n8n:latest
    restart: always
    ports:
      - "5678:5678"
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_USER=n8n
      - DB_POSTGRESDB_PASSWORD=n8npassword
      - N8N_SECURE_COOKIE=false

      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=strongpassword

      - GENERIC_TIMEZONE=Asia/Ho_Chi_Minh
      - TZ=Asia/Ho_Chi_Minh
    volumes:
      - n8n_data:/home/node/.n8n
    depends_on:
      - postgres
      - mqtt

volumes:
  postgres_data:
  n8n_data:
EOF

# Start containers
echo "🐳 Starting Docker containers..."
docker compose up -d

echo "✅ Done!"
echo
echo "🌍 Access n8n at: http://YOUR_PUBLIC_IP:5678"
echo "📡 MQTT broker at: YOUR_PUBLIC_IP:1883"
echo
echo "🔐 n8n login:"
echo "   user: admin"
echo "   pass: strongpassword"
