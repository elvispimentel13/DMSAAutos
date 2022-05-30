import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { HttpHeaders } from '@angular/common/http';
import { Observable, firstValueFrom } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Inventory } from '../interfaces/inventory';
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
  getInventory(dealerItemInfo:string, currentRoute: string): Observable<Inventory[]> {
    let apiUrl: string = this.inventoryBaseUrl;   
    let resultList: boolean = true;
    if(currentRoute)
    {
      if(dealerItemInfo){
        apiUrl += dealerItemInfo;
      }
    }
    return this.http.get<Inventory[]>(apiUrl)
                    .pipe(
                      catchError(this.errorHandler('getInventory', []))
                    );     
  }
}