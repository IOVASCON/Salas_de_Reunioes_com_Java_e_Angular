package com.iov.room.repository;

import com.iov.room.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {
    // Aqui você pode adicionar consultas customizadas se necessário
}
