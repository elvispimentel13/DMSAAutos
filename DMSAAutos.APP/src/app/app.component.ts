import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, NavigationStart, NavigationEnd } from '@angular/router';
import { ThemePalette } from '@angular/material/core';
import { MatSlideToggleChange } from '@angular/material/slide-toggle';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit{
  public inventoryRecords: number = 0;
  public currentAction: string = "home";
  public title = 'DMS American Autos';
  public currentActionDescription: string = "Inventory";
  public showInventory = true;
  public assignmentChecked = false;
  private currentUrl: string[] = [];
  private resources: string[] = ['inventory', 'assignment'];
  constructor(private router: Router,
              private activatedRoute: ActivatedRoute){
  }
  ngOnInit(): void {
    this.router.events.subscribe(event => {
      if (event instanceof NavigationStart){
        let url = ((<NavigationStart>event).url).split('/');
        if(url && url.length>0)
        {
          this.currentUrl = url.filter(r=>r);
          this.assignmentChecked = this.currentUrl.some(r=>r.includes("assignment"));
        }
      }
      if(event instanceof NavigationEnd){
        let parameter: string = this.currentUrl[1];
        if(!parameter){
          parameter = (this.assignmentChecked) ? "dealer1": "home";
        }
        this.inventoryListAction(parameter, (this.assignmentChecked)?"assignment": "inventory", true);    
      }
    });  
  }

  toggle(event: MatSlideToggleChange){
    let parameter = this.currentUrl[1]??"dealer1";
    this.inventoryListAction(parameter, (event.checked)?"assignment": "inventory");
  }

  inventoryListAction(parameter: string, resource?: string, initial: boolean = false): void{
    resource = resource ?? "";
    if(!resource)
    {
      resource = (this.assignmentChecked)?"assignment": "inventory";
    }
    switch (parameter) {
      case "home":
        this.currentAction = "home";
        this.currentActionDescription = "Inventory"
        if (!initial) this.router.navigate([resource]);
        break;
      case "dealer1":
        this.currentAction = "looks_one";
        this.currentActionDescription = "Dealer"
        if (!initial)this.router.navigate([`${resource}/dealer1`]);
        break;
      case "dealer2":
        this.currentAction = "looks_two";
        this.currentActionDescription = "Dealer"
        if (!initial)this.router.navigate([`${resource}/dealer2`]);
        break;
      default:
        break;
    }
    
  }
  updateRecordsQuantity(recordsQty: number){
    this.inventoryRecords = recordsQty;
  }
}
