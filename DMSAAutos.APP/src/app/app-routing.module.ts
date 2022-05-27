import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InventoryComponent } from './inventories/inventory.component';

const routes: Routes = [{ path: 'inventory/:dealerName', component: InventoryComponent},
                        { path: 'item/:inventoryId', component: InventoryComponent}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
