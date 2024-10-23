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
