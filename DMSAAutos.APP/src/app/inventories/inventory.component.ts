import { InventoryService } from './inventory.service';
import { Component, OnInit, ViewChild, 
         Output, EventEmitter } from '@angular/core';
import { IInventory } from '../interfaces/inventory';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router,NavigationStart } from '@angular/router';
import { DealerInventory } from "../models/dealerInventory";
@Component({
    selector: 'app-inventory',
    templateUrl: './inventory.component.html',
    providers: [InventoryService],
    styleUrls: ['./inventory.component.scss']
})

export class InventoryComponent implements OnInit {
    @Output() inventoryListAction: EventEmitter<any> = new EventEmitter()
    @Output() updateRecordsQuantity:EventEmitter<number> = new EventEmitter();
    inventory: IInventory[] = [];
    dealerInventory?: DealerInventory = new DealerInventory();
    displayedColumns: string[] = ['inventoryId', 'dealerName', 
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
            if(this.currentRoute == "assignment" && this.dealerItemInfo == "")
              this.dealerItemInfo = "dealer1";
            this.getInventory(this.dealerItemInfo, this.currentRoute);
          }
        }
      });
    }
    getInventory(dealerItemInfo: string, currentRoute: string): void {
      this.inventoryService.getInventory(dealerItemInfo, currentRoute)
        .subscribe({
          next:(inventory)=>{
            let itemsQty = 0;
            const result = this.dealerInventory?.getInventory(dealerItemInfo, inventory, currentRoute);
            if(result){
              this.dataSource = new MatTableDataSource(result);
              itemsQty = result.length;
            }
            else {
              this.dataSource = new MatTableDataSource(inventory);
              itemsQty = inventory.length;
            }
            this.dataSource.paginator = this.paginator;
            this.dataSource.sort = this.sort;
            this.updateRecordsQuantity.emit(itemsQty)
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