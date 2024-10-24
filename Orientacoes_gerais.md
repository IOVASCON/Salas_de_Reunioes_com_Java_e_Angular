# Etapas do Projeto

    Criação da Estrutura de Diretórios e Arquivos:
        Implementamos a estrutura de pastas e arquivos necessária para o projeto, substituindo corretamente as pastas antigas e adaptando o projeto para utilizar Gradle como gerenciador de build, em vez de Maven, como foi no projeto original.

    Configuração do Projeto no Spring Boot:
        Configuramos o Spring Boot com as dependências necessárias, como Spring Data JPA para persistência de dados e H2 Database como banco de dados em memória.
        Também fizemos as configurações essenciais no arquivo application.yml para garantir o funcionamento adequado do H2 Database e do servidor Tomcat.

    Desenvolvimento do Backend:
        Criamos o backend com as funcionalidades básicas da API REST para gerenciamento de salas de reuniões, com os seguintes endpoints:
            GET /api/v1/rooms: para listar todas as salas.
            POST /api/v1/rooms: para criar uma nova sala.
            GET /api/v1/rooms/{id}: para obter os detalhes de uma sala específica.
            PUT /api/v1/rooms/{id}: para atualizar as informações de uma sala.
            DELETE /api/v1/rooms/{id}: para excluir uma sala.
        Testamos com sucesso as funcionalidades da API usando o Postman, onde conseguimos criar uma nova sala, listar e buscar as salas registradas no sistema.

    Verificação no Console do H2 Database:
        Acessamos o console do banco de dados H2 pelo navegador e confirmamos que a tabela ROOM foi criada corretamente e que os dados das salas estavam sendo salvos e recuperados conforme esperado.

## Próximos Passos

    Desenvolvimento do Front-End com Angular:
        A próxima etapa envolve o desenvolvimento do front-end. Utilizaremos o Angular para criar uma interface de usuário (UI) para que os usuários possam interagir com a aplicação. O objetivo é criar uma Single Page Application (SPA), que consuma os endpoints da API que já implementamos.
        Isso incluirá:
            Criar formulários para adicionar e editar salas de reuniões.
            Listar as salas de reuniões existentes em uma interface amigável.
            Implementar validações nos formulários para garantir que as entradas sejam corretas.

    Integração Front-End e Back-End:
        Vamos integrar o front-end em Angular com o back-end desenvolvido em Spring Boot. Isso será feito utilizando serviços HTTP no Angular para chamar os endpoints da API que criamos.
        As operações CRUD (Create, Read, Update, Delete) serão acessíveis a partir da interface da aplicação, permitindo uma interação dinâmica.

    Teste de Integração e Ajustes Finais:
        Após a integração do front-end e back-end, faremos testes end-to-end para garantir que todas as funcionalidades estejam operando corretamente.
        Ajustaremos a aplicação conforme necessário, tratando de qualquer bug ou comportamento inesperado que surgir durante os testes.

    Deploy do Aplicativo:
        Quando o aplicativo estiver completamente funcional, o próximo passo seria preparar o ambiente para deploy. Isso pode ser feito utilizando serviços como Heroku, AWS, ou Azure para hospedar o back-end Spring Boot e o front-end Angular.
        O banco de dados H2 pode ser substituído por um banco de dados mais robusto, como MySQL ou PostgreSQL, caso o uso em produção exija persistência de dados além da execução em memória.

    Considerações para Produção:
        Antes do deploy, revisaríamos aspectos como segurança, escalabilidade, e performance.
        Implementaríamos autenticação e autorização se o sistema for usado por vários usuários com permissões diferentes.

## Conclusão

Concluímos a criação de uma API funcional com Spring Boot para gerenciar salas de reuniões. Testamos com sucesso o back-end usando Postman e o banco de dados H2. O próximo passo será o desenvolvimento do front-end Angular para criar uma interface amigável, e a integração dos dois. Assim que estiver completo, o projeto poderá ser testado por usuários reais e, eventualmente, ser disponibilizado em um ambiente de produção.

## Arquivo schema.sql

    -- Tabela de salas de reunião
    CREATE TABLE room (
        id BIGINT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        location VARCHAR(255) NOT NULL
    );

    -- Tabela de reuniões
    CREATE TABLE meeting (
        id BIGINT AUTO_INCREMENT PRIMARY KEY,
        room_id BIGINT NOT NULL,
        date DATE NOT NULL,
        start_time TIME NOT NULL,
        end_time TIME NOT NULL,
        attendees INT NOT NULL,
        CONSTRAINT fk_room_meeting FOREIGN KEY (room_id) REFERENCES room(id) ON DELETE CASCADE
    );

    -- Tabela de participantes
    CREATE TABLE attendee (
        id BIGINT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE
    );

    -- Tabela de associação entre reuniões e participantes
    CREATE TABLE meeting_attendee (
        meeting_id BIGINT NOT NULL,
        attendee_id BIGINT NOT NULL,
        PRIMARY KEY (meeting_id, attendee_id),
        CONSTRAINT fk_meeting FOREIGN KEY (meeting_id) REFERENCES meeting(id) ON DELETE CASCADE,
        CONSTRAINT fk_attendee FOREIGN KEY (attendee_id) REFERENCES attendee(id) ON DELETE CASCADE
    );

## Explicação das tabelas e relações

1. Room (Sala de Reunião):
        id: Chave primária com auto-incremento.
        name: Nome da sala de reunião.
        location: Localização da sala de reunião.

2. Meeting (Reunião):
        id: Chave primária com auto-incremento.
        room_id: Chave estrangeira que referencia a sala onde a reunião será realizada.
        date: Data da reunião.
        start_time: Hora de início da reunião.
        end_time: Hora de término da reunião.
        attendees: Quantidade total de participantes esperados na reunião.
        A chave estrangeira room_id está relacionada à tabela room e usa ON DELETE CASCADE, o que significa que se uma sala for excluída, todas as reuniões associadas a essa sala também serão excluídas.

3. Attendee (Participante):
        id: Chave primária com auto-incremento.
        name: Nome do participante.
        email: E-mail do participante, com a restrição de ser único (UNIQUE).

4. Meeting_Attendee:
        Tabela intermediária para lidar com o relacionamento muitos para muitos entre reuniões e participantes.
        meeting_id: Chave estrangeira que referencia a reunião.
        attendee_id: Chave estrangeira que referencia o participante.
        A chave primária é composta por ambas as colunas meeting_id e attendee_id, criando uma combinação única para cada participante em cada reunião.
