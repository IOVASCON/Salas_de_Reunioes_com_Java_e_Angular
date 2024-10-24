import { Component, OnInit } from '@angular/core';
import { RoomService } from '../room.service';
import { Room } from '../room';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';  // Adicionando Router para navegação

@Component({
  selector: 'app-room-list',
  templateUrl: './room-list.component.html',
  styleUrls: ['./room-list.component.css']
})
export class RoomListComponent implements OnInit {

  rooms!: Observable<Room[]>;  // Adicionando '!' para indicar que será inicializado posteriormente

  constructor(private roomService: RoomService, private router: Router) { }  // Adicionando Router ao construtor

  ngOnInit(): void {
    this.reloadData();  // Carregar os dados na inicialização
  }

  reloadData() {
    this.rooms = this.roomService.getRoomsList();  // Certifique-se de que o método no serviço retorna um Observable
  }

  deleteRoom(id: number) {
    this.roomService.deleteRoom(id)
      .subscribe(
        data => {
          console.log(data);
          this.reloadData();  // Recarregar a lista de salas após a exclusão
        },
        error => console.log(error)
      );
  }

  roomDetails(id: number) {
    this.router.navigate(['details', id]);  // Navegar para os detalhes da sala
  }

  updateRoom(id: number) {
    this.router.navigate(['update', id]);  // Navegar para a atualização da sala
  }
}
