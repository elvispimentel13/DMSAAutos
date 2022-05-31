import { IInventory } from "../interfaces/inventory";
import { Dealer } from "../models/dealer";

export class Dealer1 extends Dealer {
    private inventoryDealer: IInventory[] = [];
    setItemToInventory(item: IInventory){
        this.inventoryDealer.push({...item});
    }
    getInventoryDealer(_: boolean = false): IInventory[] {
        return this.inventoryDealer;
    }
}

