import { IInventory } from "../interfaces/inventory";
import { Dealer } from "../models/dealer";
export class Dealer2 extends Dealer {
    private inventoryDealer2: IInventory[] = [];
    setItemToInventory(item: IInventory){
        this.inventoryDealer2.push({...item});
    }
    displayNameTransform(displayName: string): string {
        return `Car: ${displayName.toUpperCase()} - Dealer(2)`;
    }
    getInventoryDealer(itemsTransformedFromOrigin: boolean = false){
        if(!itemsTransformedFromOrigin) this.inventoryDealer2.forEach(d=> d.displayName = this.displayNameTransform(d.displayName));
        return this.inventoryDealer2;
    }
}