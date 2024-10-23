# Definindo o diretório base do projeto
BASE_DIR="L:/VSCode/JAVA/DIO/Controle_Salas_Reunioes"

# Criando diretórios e arquivos para o eureka-service
mkdir -p "$BASE_DIR/eureka-service/src/main/java/com/iov/eureka"
mkdir -p "$BASE_DIR/eureka-service/src/main/resources"
touch "$BASE_DIR/eureka-service/src/main/java/com/iov/eureka/EurekaServiceApplication.java"
touch "$BASE_DIR/eureka-service/src/main/resources/application.yml"
touch "$BASE_DIR/eureka-service/build.gradle"

# Criando diretórios e arquivos para o room-service
mkdir -p "$BASE_DIR/room-service/src/main/java/com/iov/room/controller"
mkdir -p "$BASE_DIR/room-service/src/main/java/com/iov/room/model"
mkdir -p "$BASE_DIR/room-service/src/main/java/com/iov/room/repository"
mkdir -p "$BASE_DIR/room-service/src/main/java/com/iov/room/service"
mkdir -p "$BASE_DIR/room-service/src/main/resources"
mkdir -p "$BASE_DIR/room-service/src/test/java/com/iov/room"
touch "$BASE_DIR/room-service/src/main/java/com/iov/room/controller/RoomController.java"
touch "$BASE_DIR/room-service/src/main/java/com/iov/room/model/Room.java"
touch "$BASE_DIR/room-service/src/main/java/com/iov/room/repository/RoomRepository.java"
touch "$BASE_DIR/room-service/src/main/java/com/iov/room/service/RoomService.java"
touch "$BASE_DIR/room-service/src/main/resources/application.yml"
touch "$BASE_DIR/room-service/src/main/resources/schema.sql" # Arquivo para schema do H2
touch "$BASE_DIR/room-service/src/main/resources/data.sql"   # Arquivo para dados iniciais
touch "$BASE_DIR/room-service/build.gradle"

# Criando diretórios e arquivos para o api-gateway
mkdir -p "$BASE_DIR/api-gateway/src/main/java/com/iov/gateway"
mkdir -p "$BASE_DIR/api-gateway/src/main/resources"
touch "$BASE_DIR/api-gateway/src/main/java/com/iov/gateway/ApiGatewayApplication.java"
touch "$BASE_DIR/api-gateway/src/main/resources/application.yml"
touch "$BASE_DIR/api-gateway/build.gradle"

# Criando diretório para images
mkdir -p "$BASE_DIR/images/"

# Criando o arquivo docker-compose.yml na raiz do projeto para rodar os microsserviços com Docker
touch "$BASE_DIR/docker-compose.yml"

# Criando README.md na raiz do projeto
touch "$BASE_DIR/README.md"

# Criando .gitignore na raiz do projeto
touch "$BASE_DIR/.gitignore"

# Mensagem final
echo "Estrutura do Gerenciador de Salas de Reuniões criada com sucesso em $BASE_DIR"
