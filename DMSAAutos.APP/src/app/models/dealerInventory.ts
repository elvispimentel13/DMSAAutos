import { IInventory } from "../interfaces/inventory";
import { Dealer1 } from "./dealer1";
import { Dealer2 } from "./dealer2";
type ResultTypes<T> = T extends true ? Dealer1 : Dealer2;
export class DealerInventory {
    getInventory(dealerName: string, items: IInventory[], currentRoute: string = "") {
        const validDealer = this.checkValidDealer(dealerName);
        if(!validDealer) return null;
        let instance = this.getInstance(dealerName == "dealer1");
        items.map(i=> instance.setItemToInventory(i));
        const itemsTransformedFromOrigin = (currentRoute == "assignment");
        return instance.getInventoryDealer(itemsTransformedFromOrigin);
    }
    getInstance<T extends boolean>(bool: T):  ResultTypes<T> {
        const instance = bool ? Dealer1 : Dealer2;
        return new instance() as ResultTypes<T>;
    }
    checkValidDealer(dealerName: string){
        let isValid = true;
        if(!dealerName) return false;
        switch (dealerName.toLowerCase().trim()) {
            case "dealer1":
                return true;
            case "dealer2":
                return true;
            default:
                return false;
        }
    }
}