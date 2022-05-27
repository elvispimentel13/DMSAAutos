--INITIALIZE DATA
/*
Vehicles.Colors
- Source: extracted from cars.com
- Values: Beige, Black, Blue, Brown, Gold, Gray, Green, Orange, Purple, Red, Silver, White, Yellow
*/
BEGIN TRAN Insert_Colors
INSERT INTO Vehicles.Colors ([Color])
VALUES ('Beige'), ('Black'), ('Blue'), ('Brown'), ('Gold'), ('Gray'), ('Green'), ('Orange'), ('Purple'), ('Red'), ('Silver'), ('White'), ('Yellow');
COMMIT TRAN Insert_Colors
GO
BEGIN TRAN Insert_Vehicle_Makes
INSERT INTO Vehicles.Makes ([MakeName])
VALUES ('Toyota'), ('Honda'), ('Chevrolet'), ('Ford'), ('Jeep'), ('BMW'), ('Porsche'), ('Subaru'), ('Nissan'), 
       ('Cadillac'), ('Volkswagen'), ('Lexus'), ('Audi'), ('Ferrari'), ('Volvo'), ('Jaguar'), ('GMC'), ('Buick'), ('Acura'), 
       ('Hyundai'), ('Mazda'), ('Tesla'), ('Kia'), ('Infiniti'), ('Genesis')
COMMIT TRAN Insert_Vehicle_Makes
GO
/*
    USED POSTMAN to call a api endpoint from https://vpic.nhtsa.dot.gov/, tests generate data to be inserted.
    PD: could be used a direct insert with a endpoint in my end, but need to validate data manually and to accomplish my assignment faster.
*/
BEGIN TRAN Insert_Models
INSERT INTO Vehicles.Models ([MakeID],[ModelName])
SELECT Makes.MakeID, ModelName FROM (
--BOD
--5083-Toyota-car
SELECT 448 MakeID_External, 'SCION xA' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'SCION tC' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Corolla' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'PRIUS' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Scion FR-S' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Yaris' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Avalon' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Corolla Matrix' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Camry' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Camry Solara' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'SCION xD' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'FCHV-adv' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Tercel' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Celica' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Supra' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'MR2' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Paseo' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Echo' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Cressida' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Mirai' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Scion iQ' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Scion iM' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, '86' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Scion iA' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Prius V' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Prius C' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Prius Plug-in' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Starlet' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Corona' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'COROLLA iM' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'C-HR' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Prius Prime' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'Yaris iA' ModelName, 'Toyota' MakeName UNION ALL
SELECT 448 MakeID_External, 'GR86' ModelName, 'Toyota' MakeName UNION ALL

--448-Honda-car
SELECT 474 MakeID_External, 'Accord' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'Civic' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'Odyssey' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'Insight' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'FCX Clarity' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'Fit' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'CR-Z' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'S2000' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'Prelude' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'del Sol' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'EV Plus' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'Clarity' ModelName, 'Honda' MakeName UNION ALL
SELECT 474 MakeID_External, 'CIVIC SI' ModelName, 'Honda' MakeName UNION ALL

--474-Chevrolet-car
SELECT 467 MakeID_External, 'Aveo' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Camaro' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Caprice Police Vehicle' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Corvette' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Cruze' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Impala' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Malibu' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Sonic' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Spark' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'SS' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Volt' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Suburban' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Tracker' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Geo Prizm' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Matiz' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Cobalt' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Optra' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Kalos' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Monte Carlo' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Epica' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Cavalier' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'U100' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Astro Van' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Lumina' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Alero' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Caprice' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Corsica' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Beretta' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Hearse/Limo' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Metro' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Military Truck' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Trax' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'S-10 Pickup' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'C/K Pickup' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'P - Series' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Blazer' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Impala Limited' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Bolt EV' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Hearse/Limo Commercial Chassis' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Celebrity' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Geo Spectrum' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'G-Series' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Chevette' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Geo Sprint' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Nova' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Citation' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Malibu Classic' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Onix' ModelName, 'Chevrolet' MakeName UNION ALL
SELECT 467 MakeID_External, 'Bolt EUV' ModelName, 'Chevrolet' MakeName UNION ALL

--467-Ford-car
SELECT 460 MakeID_External, 'Crown Victoria' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Focus' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Fusion' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Mustang' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Taurus' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Thunderbird' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'GT' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Five Hundred' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Fiesta' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'C-max' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Escort' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'ZX2' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Aspire' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Probe' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Contour' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Festiva' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Tempo' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Laser' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'LTD' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Fairmont' ModelName, 'Ford' MakeName UNION ALL
SELECT 460 MakeID_External, 'Granada' ModelName, 'Ford' MakeName UNION ALL

--460-Jeep-truck
SELECT 483 MakeID_External, 'Wrangler' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Liberty' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Cherokee' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Compass' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Patriot' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Commander' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Grand Cherokee' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Grand Wagoneer' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Comanche' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Wagoneer' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'J-10' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'J-20' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Wrangler JK' ModelName, 'Jeep' MakeName UNION ALL
SELECT 483 MakeID_External, 'Gladiator' ModelName, 'Jeep' MakeName UNION ALL

--483-BMW-car
SELECT 452 MakeID_External, '128i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '135i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '328i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M3' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '335i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '335is' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '335d' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '528i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '535i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'X5' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '550i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'X3' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '740i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '740Li' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750Li' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '760Li' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'Z4' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750Lxi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M6' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '528xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '640i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '650i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '650xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '1M' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'Active E' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M5' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '228i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M235i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '320i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '328d' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'i3' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'i8' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'ActiveHybrid 3' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '428i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '435i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '535d' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'ActiveHybrid 5' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'X1' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '535xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '328xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '335xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '525i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '530i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '530xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '525xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325Cic' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '330Cic' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M3Cic' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '330Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325xiT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '530xiT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '330i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '330xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '760i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325iT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '545i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '645Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '645Cic' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '745i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '745Li' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '318i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '318iS' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '318iC' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325iS' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325iC' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '525iT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '530iT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '540i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '840Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '850Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '850CSi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '318ti' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '328iC' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '328iS' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'Z3' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '323i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '323is' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '323iC' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'Z8' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '525iA' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '530iA' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '540iA' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '525iAT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '540iAT' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'Alpina' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '645i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '335' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '740iL' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750iL' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M3Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M2' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '340i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '330e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M4' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '328Ci' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '735i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '735iL' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '850i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325ix' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325/325e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '635CSi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '535i/535is' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'L7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '524td' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '528e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '325i/325is' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '230i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M240i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '430i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '440i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'B7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '740e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750i / ALPINA B7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '533i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '633 csi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '733i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '730i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '540d' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '530e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M550i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M760i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '650i / ALPINA B6' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750Li / ALPINA B7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750Lxi / ALPINA B7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750xi / ALPINA B7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '750i / B7' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '650i / B6' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '640xi' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M340i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '745e' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '840i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M850i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M8' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M440i' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'M760Li' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, '745Le' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'B8' ModelName, 'BMW' MakeName UNION ALL
SELECT 452 MakeID_External, 'i4' ModelName, 'BMW' MakeName UNION ALL

--452-Porsche-car
SELECT 584 MakeID_External, '911' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, 'Boxster' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, 'Cayenne' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, 'Cayman' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, 'Panamera' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, '918' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, '944' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, '928' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, '924' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, '968' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, '718' ModelName, 'Porsche' MakeName UNION ALL
SELECT 584 MakeID_External, 'Taycan' ModelName, 'Porsche' MakeName UNION ALL

--584-Subaru-car
SELECT 523 MakeID_External, 'Legacy' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Outback' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Forester' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Impreza' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'WRX' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'BRZ' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'SVX' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Justy' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Loyale' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Brat' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'XT' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'XT6' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'DL' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'GL' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'GL-10' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'RX' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'Standard' ModelName, 'Subaru' MakeName UNION ALL
SELECT 523 MakeID_External, 'GLF' ModelName, 'Subaru' MakeName  UNION ALL

--523-Nissan-car
SELECT 478 MakeID_External, 'GT-R' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Versa' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Versa Note' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Altima' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Leaf' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, '370Z' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Sentra' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Maxima' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, '350Z' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, '240SX' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, '300ZX' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Altra-EV' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'NX' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'NX/Sentra' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Stanza' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Axxess' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'PULSAR' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Stanza Wagon' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, '200SX' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Rogue Sport' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Sentra Classic' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Altra' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Micra' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'Kicks' ModelName, 'Nissan' MakeName UNION ALL
SELECT 478 MakeID_External, 'NISSAN Z' ModelName, 'Nissan' MakeName UNION ALL

--478-Cadillac-car
SELECT 469 MakeID_External, 'ATS' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'CTS' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'ELR' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'XTS' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'STS' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'DTS' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'XLR' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Limousine' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Hearse' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Deville' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Eldorado' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Catera' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Seville' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Commercial Chassis' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Fleetwood' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'CT6' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, '60 Special' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Allante' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Brougham' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'Cimarron' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'CT4' ModelName, 'Cadillac' MakeName UNION ALL
SELECT 469 MakeID_External, 'CT5' ModelName, 'Cadillac' MakeName UNION ALL

--469-Volkswagen-car 
SELECT 482 MakeID_External, 'Golf' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Passat' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Phaeton' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Touareg' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Jetta' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'GTI' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'R32' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Jetta Wagon' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Rabbit' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Eos' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Golf SportWagen' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Golf III' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Corrado' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'EuroVan' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'e-Golf' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Beetle' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'CC' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Jetta SportWagen' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Cabrio' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Golf GTI' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Golf R' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'CABRIOLET' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'FOX' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Quantum' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Scirocco' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Dasher' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Golf Alltrack' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Arteon' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'GLI' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Jetta GLI' ModelName, 'Volkswagen' MakeName UNION ALL
SELECT 482 MakeID_External, 'Arteon 4Motion' ModelName, 'Volkswagen' MakeName UNION ALL

--482-Lexus-car
SELECT 515 MakeID_External, 'GS' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'LS' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'SC' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'IS' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'ES' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'CT' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'HS' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'RC' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'LFA' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'RC-F' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'LC' ModelName, 'Lexus' MakeName UNION ALL
SELECT 515 MakeID_External, 'UX' ModelName, 'Lexus' MakeName UNION ALL

--515-Audi-car
SELECT 582 MakeID_External, 'TT' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A4' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'S4' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A6' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'RS6' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'allroad' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A8' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'RS4' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A3' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'S6' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'S8' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'Q7' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A5' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'S5' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'R8' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'TTS' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'RS5' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A7' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'TT RS' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, '90' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, '100' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'V8' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'Cabriolet' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'S3' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'S7' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'RS7' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, '5000' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, '4000' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, '80' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, '200' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'Coupe' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'RS3' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A6 allroad' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A8 e' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'RS e-tron GT' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'A8 L' ModelName, 'Audi' MakeName UNION ALL
SELECT 582 MakeID_External, 'e-tron GT' ModelName, 'Audi' MakeName UNION ALL

--582-Ferrari-car
SELECT 603 MakeID_External, '612 Scaglietti' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F430 Coupe' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '599 GTB' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F430 Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '599 GTB Fiorano' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '430 Scuderia' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F430' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '430 Scuderia Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '360 Modena/360 Modena F1' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '360 Spider/360 Spider F1' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '575 M Maranello/575 M Maranello F1' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '456 MGT' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '456 MGTA' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'Enzo' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F355' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '550 Maranello' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F12 Berlinetta' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'California T' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'FF' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'La Ferrari' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '458 Italia' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '458 Speciale' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '458 Speciale Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '458 Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'California' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '599 GTO' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '348 tb' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '348 ts' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '512 TR' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '355 Berlinetta' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '355 GTS' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '348 Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '456 GT' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '355 Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'Mondial T' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'Testarossa' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F40' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '328 GTB' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '328 GTS' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '3.2 Mondial' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '328' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308GTB Quattrovalvole' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308GTS Quattrovalvole' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'Mondial 8' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308 Convertible' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '488 GTB' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '488 GTS' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F12 Special Series' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F60 America' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308GTBi' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308GTSi' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308GTB' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '308GTS' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F12 tdf (Tour de France)' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'GTC4Lusso' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '488 Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '812 Superfast' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'Portofino' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '488 Pista' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F8 Tributo' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '812GTS' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F8 Spider' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'SF 90 STradale' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'Roma' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, 'F164BCB' ModelName, 'Ferrari' MakeName UNION ALL
SELECT 603 MakeID_External, '488 Pista Spider' ModelName, 'Ferrari' MakeName UNION ALL

--603-Volvo-car
SELECT 485 MakeID_External, 'S60' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'S80' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V60' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'XC60' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'XC70' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'S40' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V50' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'C70' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V70' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'XC90' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'C30' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '940 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '960 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '850 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V60CC' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'S60 Cross Country' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'S90' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V90' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V90CC' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '240 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '740 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '780 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '760 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'V40' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'S70' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, '260 Series' ModelName, 'Volvo' MakeName UNION ALL
SELECT 485 MakeID_External, 'C70 / C30' ModelName, 'Volvo' MakeName UNION ALL

--485-Jaguar-car
SELECT 442 MakeID_External, 'XJ' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XF' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XK' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'X-Type' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'S-Type' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'F-Type' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'Vanden Plas' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XK8' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XJR' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XE' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'Super V8' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XJ8' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XJ6' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XJS' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XJ12' ModelName, 'Jaguar' MakeName UNION ALL
SELECT 442 MakeID_External, 'XKR' ModelName, 'Jaguar' MakeName UNION ALL

--442-GMC-car
SELECT 472 MakeID_External, 'Electric Vehicle' ModelName, 'GMC' MakeName UNION ALL
SELECT 472 MakeID_External, 'C/K Pickup' ModelName, 'GMC' MakeName UNION ALL
SELECT 472 MakeID_External, 'P Truck Forward' ModelName, 'GMC' MakeName UNION ALL
SELECT 472 MakeID_External, 'Motorhome Chassis' ModelName, 'GMC' MakeName UNION ALL
SELECT 472 MakeID_External, 'Rally' ModelName, 'GMC' MakeName UNION ALL
SELECT 472 MakeID_External, 'S15 Pickup' ModelName, 'GMC' MakeName UNION ALL

--472-Buick-car
SELECT 468 MakeID_External, 'LaCrosse' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Regal' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Verano' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Lucerne' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Allure' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Park Avenue' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'LeSabre' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Century' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Riviera' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Skylark' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Coachbuilder' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Roadmaster' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Cascada' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Reatta' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Electra' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Skyhawk' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Somerset' ModelName, 'Buick' MakeName UNION ALL
SELECT 468 MakeID_External, 'Regal TourX' ModelName, 'Buick' MakeName UNION ALL

--468-Acura-car
SELECT 475 MakeID_External, 'RL' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'TL' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'TSX' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'RLX' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'ILX' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'RSX' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'Integra' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'CL' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'NSX' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'Legend' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'TLX' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'Vigor' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'TLX TYPE-S ' ModelName, 'Acura' MakeName UNION ALL
SELECT 475 MakeID_External, 'NSX Type S' ModelName, 'Acura' MakeName UNION ALL

--475-Hyundai-car
SELECT 498 MakeID_External, 'Equus' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Santa Fe' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Tucson' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Veloster' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Genesis Coupe' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Sonata' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Elantra' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Entourage' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Azera' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Veracruz' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Accent' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Genesis' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Tiburon' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Elantra Touring' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'XG 350' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Excel' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Scoupe' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'XG300' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Elantra GT' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Pony' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Stellar' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Ioniq' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Venue' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Veloster N' ModelName, 'Hyundai' MakeName UNION ALL
SELECT 498 MakeID_External, 'Elantra N' ModelName, 'Hyundai' MakeName UNION ALL

--498-Mazda-car
SELECT 473 MakeID_External, 'MX-5' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'RX-8' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'Mazda3' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'Mazda5' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'Mazda6' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'Mazda2' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'MPV' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'Protege' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'Millenia' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, '626' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, '323' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'MX-3' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, '929' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'RX-7' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'MX-6' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'CX-3' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'GLC' ModelName, 'Mazda' MakeName UNION ALL
SELECT 473 MakeID_External, 'MX-30' ModelName, 'Mazda' MakeName UNION ALL

--473-Tesla-car
SELECT 441 MakeID_External, 'Model S' ModelName, 'Tesla' MakeName UNION ALL
SELECT 441 MakeID_External, 'Roadster' ModelName, 'Tesla' MakeName UNION ALL
SELECT 441 MakeID_External, 'Model X' ModelName, 'Tesla' MakeName UNION ALL
SELECT 441 MakeID_External, 'Model 3' ModelName, 'Tesla' MakeName UNION ALL
SELECT 441 MakeID_External, 'Model Y' ModelName, 'Tesla' MakeName UNION ALL

--441-Kia-car
SELECT 499 MakeID_External, 'Rio' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Borrego' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Forte' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Rondo' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Optima' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Sedona' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Sorento' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Sportage' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Cadenza' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'K900' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Sephia' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Spectra' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Amanti' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Spectra LD' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Sephia II/Spectra' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Forte Koup' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'Stinger' ModelName, 'Kia' MakeName UNION ALL
SELECT 499 MakeID_External, 'K5' ModelName, 'Kia' MakeName UNION ALL

--499-Infiniti-car
SELECT 480 MakeID_External, 'QX50' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'Q40' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'Q50' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'Q60' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'Q70' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'Q70L' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'Q45' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'G35' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'M35' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'M45' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'G37' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'EX35' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'M56' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'M37' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'G25' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'M35h' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'J30' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'G20' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'I35' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'I30' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'M30' ModelName, 'Infiniti' MakeName UNION ALL
SELECT 480 MakeID_External, 'QX30' ModelName, 'Infiniti' MakeName UNION ALL

--480-Genesis-car
SELECT 5083 MakeID_External, 'G80' ModelName, 'Genesis' MakeName UNION ALL
SELECT 5083 MakeID_External, 'G90' ModelName, 'Genesis' MakeName UNION ALL
SELECT 5083 MakeID_External, 'G70' ModelName, 'Genesis' MakeName 
--EOD
) as Model
LEFT JOIN Vehicles.Makes ON model.MakeName = Makes.MakeName
SELECT @@ROWCOUNT
--ROLLBACK TRAN Insert_Models
COMMIT TRAN Insert_Models
GO
BEGIN TRAN Insert_Dealers
INSERT INTO Branch.Dealers ([DealerName],[DealerAddress],[DealerDescription])
VALUES ('Dealer1', '150 Granby St, Norfolk, VA 23510', 'Dominion Enterprises Dealer 1')
     , ('Dealer2', '744 Lancaster Ave, Wayne, PA 19087', 'Dominion Enterprises Dealer 2')
--ROLLBACK TRAN Insert_Dealers
COMMIT TRAN Insert_Dealers
GO
BEGIN TRAN Insert_Customers
INSERT INTO Entity.Customers ([FirstName],[Lastname],[Phone],[Email],[CustomerCode])
VALUES ('John', 'Doe', '2409781990', 'jdoe@dominion.us', 'JD-0001')
      ,('Jane', 'Doe', '7124953225', 'janedoe@yahoo.com', 'JD-0002')
      ,('Rose', 'Harris', '2239417224', 'rharris@gmail.com', 'RH-0003')
      ,('Mary', 'Boden', '4183152000', 'mboden@hotmail.com', 'MB-0004')
--ROLLBACK TRAN Insert_Customers
COMMIT TRAN Insert_Customers
GO
BEGIN TRAN Insert_Agents
INSERT INTO Entity.Agents ([FirstName],[Lastname],[Phone],[Email],[InternalCode])
VALUES ('Michael', 'Kennedy', '7172180551', 'mkennedy@enterprises.us', 'AGD-0001')
      ,('Manny', 'Trump', '6462102214', 'mtrump@vuedms.com', 'AGD-0002')
      ,('Kamala', 'Biden', '3102485211', 'kbiden@dms.com', 'AGD-0003')
      ,('Joe', 'Harris', '2124210012', 'jharris@dominion.com', 'AGD-0004')
--ROLLBACK TRAN Insert_Agents
COMMIT TRAN Insert_Agents
GO
BEGIN TRAN Insert_Availability
INSERT INTO Vehicles.Availability ([AvailabilityDescription])
VALUES ('Auction'), ('Active'), ('Sold'), ('Maintenance')
--ROLLBACK TRAN Insert_Availability
COMMIT TRAN Insert_Availability
GO
BEGIN TRAN Insert_Inventory
INSERT INTO Vehicles.Inventory ([DealerID], [ModelID],[ColorID],[AvailabilityID],[TransmissionType],[FuelType],[PassengerCapatity],[VIN],[Price],[Odometer],[VehicleYear],[Condition],[InventoryDate])
VALUES (1, 49, 2, 2, '6-Speed Manual', 'Gas', 4, '1G1FE1R7XH0137565', 40998.00, 12811, 2017, 'Used', '2022-05-19')
      ,(1, 51, 1, 2, '6-Speed Automatic', 'Gas', 2, '1G1YY26UX75125935', 28895.00, 70967, 2007, 'Used', '2022-05-17')
      ,(1, 53, 7, 2, '6-Speed Automatic', 'Gas', 5, '1G11Z5S38LU109326', 26490.00, 52392, 2020, 'Used', '2022-05-14')
      ,(2, 79, 4, 3, '6-Speed Automatic', 'Gas', 5, 'KL7CJKSB2MB310517', 21499.00, 45729, 2021, 'Used', '2022-05-21')      -- <= Chevrolet

      ,(2, 98, 3, 2, 'Automatic Auto-Shift', 'Gas', 5, '1FADP3F26FL256020', 14950.00, 49513, 2015, 'Used', '2022-05-15')
      ,(2, 100, 2, 2, '6-Speed Manual', 'Gas', 4, '1FA6P8CF2M5117775', 47500.00, 4127, 2021, 'Used', '2022-05-22')
      ,(2, 101, 6, 2, 'Automatic', 'Gas', 5, '1FAHP2KT3JG123064', 27898.00, 82289, 2018, 'Used', '2022-05-19')
      ,(1, 105, 5, 3, 'Automatic Auto-Shift', 'Gas', 5, '3FADP4BJ8KM137722', 17950.00, 51912, 2019, 'Used', '2022-05-23')  -- <= Ford

      ,(1, 331, 7, 2, '6-Speed Automatic', 'Gas', 5, '1G6AA5RX7D0134673', 14250.00, 89835, 2013, 'Used', '2022-05-15')
      ,(2, 334, 5, 2, '6-Speed Automatic', 'Gas', 5, '2G61M5S35H9156827', 24950.00, 58423, 2017, 'Used', '2022-05-22')
      ,(1, 340, 4, 2, '4-Speed Automatic', 'Gas', 5, '1G6KF57964U180787', 7900.00, 67852, 2004, 'Used', '2022-05-19')
      ,(2, 352, 13, 2, '10-Speed Automatic', 'Gas', 5, '1G6DP5RKXM0109900', 44840.00, 19874, 2021, 'Used', '2022-05-23')    -- <= Cadillac

      ,(1, 627, 11, 1, '1-Speed Automatic', 'Electric', 5, '5YJYGDEE7MF074582', 71837.00, 16150, 2021, 'Used', '2022-05-11')
      ,(2, 623, 7, 2, '1-Speed Automatic', 'Electric', 5, '5YJSA1E69MF451587', 134000.00, 759, 2021, 'Used', '2022-05-20')     -- <= Tesla
      ,(1, 668, 9, 3, '8-Speed Automatic', 'Gas', 5, 'KMTGC4SD0MU045176', 63555.00, 0, 2021, 'New', '2022-05-25')
      ,(2, 670, 10, 4, 'Automatic', 'Gas', 5, 'KMTG44LA8KU030584', 35237.00, 20309, 2019, 'Used', '2022-05-21')             -- <= Genesis
--ROLLBACK TRAN Insert_Inventory
--SELECT * FROM Vehicles.Inventory
COMMIT TRAN Insert_Inventory
GO
BEGIN TRAN Insert_Sales
INSERT INTO Vehicles.Sales ([InventoryID],[AgentID],[CustomerID], [SaleDate])
VALUES (4, 1, 2, '2022-05-23')
      ,(8, 3, 1, '2022-05-25')
      ,(15, 4, 4, '2022-05-25')
--ROLLBACK TRAN Insert_Sales
COMMIT TRAN Insert_Sales
GO
