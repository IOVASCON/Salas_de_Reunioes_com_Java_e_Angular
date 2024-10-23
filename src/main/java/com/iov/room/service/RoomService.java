package com.iov.room.service;

import com.iov.room.exception.ResourceNotFoundException;
import com.iov.room.model.Room;
import com.iov.room.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomService {

    @Autowired
    private RoomRepository roomRepository;

    // Método para listar todas as salas
    public List<Room> getAllRooms() {
        return roomRepository.findAll();
    }

    // Método para buscar uma sala pelo ID
    public Room getRoomById(Long roomId) throws ResourceNotFoundException {
        return roomRepository.findById(roomId)
                .orElseThrow(() -> new ResourceNotFoundException("Room not found with id: " + roomId));
    }

    // Método para criar uma nova sala
    public Room createRoom(Room room) {
        return roomRepository.save(room);
    }

    // Método para atualizar uma sala existente
    public Room updateRoom(Long roomId, Room roomDetails) throws ResourceNotFoundException {
        Room room = roomRepository.findById(roomId)
                .orElseThrow(() -> new ResourceNotFoundException("Room not found with id: " + roomId));

        room.setName(roomDetails.getName());
        room.setDate(roomDetails.getDate());
        room.setStartHour(roomDetails.getStartHour());
        room.setEndHour(roomDetails.getEndHour());

        return roomRepository.save(room);
    }

    // Método para deletar uma sala
    public void deleteRoom(Long roomId) throws ResourceNotFoundException {
        Room room = roomRepository.findById(roomId)
                .orElseThrow(() -> new ResourceNotFoundException("Room not found with id: " + roomId));
        
        roomRepository.delete(room);
    }
}
