import { Component } from '@angular/core';

@Component({
  selector: 'app-create-room',
  templateUrl: './create-room.component.html',
  styleUrls: ['./create-room.component.css']
})
export class CreateRoomComponent {
  room: any = {};
  submitted = false;

  onSubmit() {
    this.submitted = true;
    // Lógica para salvar a sala
  }

  newRoom() {
    this.submitted = false;
    this.room = {};
  }
}
