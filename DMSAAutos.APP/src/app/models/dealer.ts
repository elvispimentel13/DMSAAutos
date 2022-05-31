import { IInventory } from "../interfaces/inventory";
export abstract class Dealer{
    abstract getInventoryDealer(itemsTransformedFromOrigin: boolean): IInventory[];
    abstract setItemToInventory(item: IInventory): void;
}