import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { InventoryComponent } from './inventories/inventory.component';

const routes: Routes = [{ path: '', redirectTo: '/inventory/', pathMatch: 'full' },
                        { path: 'inventory/:dealerName', component: InventoryComponent},
                        { path: 'assignment/:dealerName', component: AppComponent},
                        { path: 'inventory', component: InventoryComponent},
                        { path: 'assignment', redirectTo: '/assignment/dealer1', pathMatch: 'full'}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
