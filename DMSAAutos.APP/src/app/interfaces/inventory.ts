export interface IInventory{
    inventoryId: number;
    dealerId: number;
    dealerName: string;
    makeName: string;
    modelName: string;
    color: string;
    displayName: string;
    transmissionType: string;
    fuelType: string;
    passengerCapatity: number;
    vin: string;
    price: number;
    odometer: number;
    vehicleYear: number;
    condition: string;
    inventoryDate: Date;
    vehicleStatus: string;
}