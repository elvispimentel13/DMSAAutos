import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { HttpHeaders } from '@angular/common/http';
import { Observable, firstValueFrom } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { IInventory } from '../interfaces/inventory';
import { Dealer1 } from '../models/dealer1';
import { Dealer2 } from '../models/dealer2';
import { HttpErrorHandler, HandleError } from '../http-error-handler.service';
import config from '../../assets/config.json';
const httpOptions = {
    headers: new HttpHeaders({
        'Content-Type': 'text/plain'
    })
};

@Injectable()
export class InventoryService {
    inventoryBaseUrl = config.inventoryUrl;
    private errorHandler: HandleError;
  constructor(
    private http: HttpClient,
    httpErrorHandler: HttpErrorHandler) {
    this.errorHandler = httpErrorHandler.createHandleError('InventoryService');
  }
  getInventory<T extends IInventory>(dealerItemInfo:string, currentRoute: string): Observable<T[]> {
    let apiUrl: string = this.inventoryBaseUrl;   
    if(currentRoute)
    {
      if(currentRoute == "assignment"){
        apiUrl = apiUrl.replace("list", currentRoute);
      }
      if(dealerItemInfo){
        apiUrl += dealerItemInfo;
      }
    }
    return this.http.get<T[]>(apiUrl)
                    .pipe(
                      catchError(this.errorHandler('getInventory', []))
                    );     
  }
}