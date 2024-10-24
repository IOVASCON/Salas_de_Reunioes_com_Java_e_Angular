import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module'; // Importando o módulo de rotas
import { CommonModule } from '@angular/common'; // Importando CommonModule
import { FormsModule } from '@angular/forms'; // Importando FormsModule para usar ngModel
import { RouterModule } from '@angular/router'; // Importando RouterModule para o router-outlet

// Importando os componentes que você criou
import { CreateRoomComponent } from './create-room/create-room.component';
import { RoomDetailsComponent } from './room-details/room-details.component';
import { RoomListComponent } from './room-list/room-list.component';
import { UpdateRoomComponent } from './update-room/update-room.component';

@NgModule({
  declarations: [
    AppComponent, 
    CreateRoomComponent,  // Inclua o CreateRoomComponent
    RoomDetailsComponent, // Inclua o RoomDetailsComponent
    RoomListComponent,    // Inclua o RoomListComponent
    UpdateRoomComponent   // Inclua o UpdateRoomComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule, 
    CommonModule, 
    FormsModule, 
    RouterModule 
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
