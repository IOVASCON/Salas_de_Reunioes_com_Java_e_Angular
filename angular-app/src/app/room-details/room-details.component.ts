import { Component } from '@angular/core';

@Component({
  selector: 'app-room-details',
  templateUrl: './room-details.component.html',
  styleUrls: ['./room-details.component.css']
})
export class RoomDetailsComponent {
  room: any = {}; // Defina a propriedade room

  list() {
    // Lógica para retornar à lista de salas
  }
}
