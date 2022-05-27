import { Component } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent{
  public inventoryRecords: number = 0;
  title = 'DMS American Autos';
  public currentAction: string = "home";
  public currentActionDescription: string = "Inventory";
  showInventory = true;
  constructor(private router: Router,
              private activatedRoute: ActivatedRoute){
  }

  storedActionPath(path?: string){
    if(!path) {
      path = localStorage.getItem("Path") ?? "";
      this.inventoryListAction(path);
    }
  }
  inventoryListAction(path: string, route?: string): void{
    if(typeof(path) == "object")
    {
      route = path['route'];
      path = path['path'];
    }

    switch (path) {
      case "home":
        this.currentAction = "home";
        this.currentActionDescription = "Inventory"
        this.storedActionPath('home');
        this.router.navigate(['']);
        break;
      case "dealer1":
        this.currentAction = "looks_one";
        this.currentActionDescription = "Dealer"
        this.storedActionPath('dealer1');
        this.router.navigate(['inventory/dealer1']);
        break;
      case "dealer2":
        this.currentAction = "looks_two";
        this.currentActionDescription = "Dealer"
        this.storedActionPath('dealer2');
        this.router.navigate(['inventory/dealer2']);
        break;
      default:
        break;
    }
    
  }
  updateRecordsQuantity(recordsQty: number){
    this.inventoryRecords = recordsQty;
  }
}
