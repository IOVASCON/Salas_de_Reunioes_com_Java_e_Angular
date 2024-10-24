import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Room } from './room';

@Injectable({
  providedIn: 'root'
})
export class RoomService {

  private baseUrl = 'http://localhost:8080/api/v1/rooms';  // URL da API

  constructor(private http: HttpClient) { }

  getRoomsList(): Observable<Room[]> {
    return this.http.get<Room[]>(`${this.baseUrl}`);
  }

  deleteRoom(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${id}`, { responseType: 'text' });
  }
}
