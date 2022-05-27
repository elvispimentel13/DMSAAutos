import { InventoryService } from './inventory.service';
import { Component, OnInit, ViewChild, 
         Output, EventEmitter, OnChanges, 
         ChangeDetectionStrategy } from '@angular/core';
import { Inventory } from '../interfaces/inventory';

import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';
import { Router,NavigationStart } from '@angular/router';

@Component({
    selector: 'app-inventory',
    templateUrl: './inventory.component.html',
    providers: [InventoryService],
    styleUrls: ['./inventory.component.scss'],
    changeDetection: ChangeDetectionStrategy.OnPush   
})

export class InventoryComponent implements OnInit {
    @Output() inventoryListAction: EventEmitter<any> = new EventEmitter()
    @Output() updateRecordsQuantity:EventEmitter<number> = new EventEmitter();
    inventory: Inventory[] = [];
    displayedColumns: string[] = ['inventoryId', 'dealerName', //'makeName', 'modelName', 'transmissionType',
                                  'displayName', 'vin', 'price', 'odometer', 
                                  'vehicleYear', 'vehicleStatus'];
    dataSource!: MatTableDataSource<any>;
  
    @ViewChild(MatPaginator) paginator!: MatPaginator;
    @ViewChild(MatSort) sort!: MatSort;
    private currentRoute: string = "";
    private dealerItemInfo: string = ""

    constructor(private inventoryService: InventoryService, 
                private router: Router) {}
    ngOnInit() {
      this.router.events.subscribe(event => {
        if (event instanceof NavigationStart){
          let url = ((<NavigationStart>event).url).split('/');
          if(url && url.length>0)
          {
            url = url.filter(r=>r);
            this.currentRoute = url[0];
            this.dealerItemInfo = (url.length>1)?url[1]: "";
            this.getInventory(this.dealerItemInfo, this.currentRoute);
          }
        }
      });
      }
    
      getInventory(dealerItemInfo: string, currentRoute: string): void {
        this.inventoryService.getInventory(dealerItemInfo, currentRoute)
          .subscribe({
            next:(inventory)=>{
              this.inventory = inventory;
              this.dataSource = new MatTableDataSource(inventory);
              this.dataSource.paginator = this.paginator;
              this.dataSource.sort = this.sort;
              this.updateRecordsQuantity.emit(this.inventory.length)
              this.inventoryListAction.emit({path: dealerItemInfo, route: currentRoute});
            },
            error:(err)=>{
              console.log(err);
            }
          });
      }
      applyFilter(event: Event) {
        const filterValue = (event.target as HTMLInputElement).value;
        this.dataSource.filter = filterValue.trim().toLowerCase();
    
        if (this.dataSource.paginator) {
          this.dataSource.paginator.firstPage();
        }
      }
    }