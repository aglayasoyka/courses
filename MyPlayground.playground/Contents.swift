import UIKit

enum Actions {
    case openWindow
    case closeWindow
    case load(Int)
    case unload(Int)
}

class Car {
    let carBrend: String
    let yearsOfProduction: Int
    let trunkVolume: Int
    var carMileage = 0.0

    init(carBrend: String,yearsOfProduction: Int,trunkVolume: Int, carMileage:Double ) {
        self.carBrend = carBrend
        self.yearsOfProduction = yearsOfProduction
        self.trunkVolume = trunkVolume
        self.carMileage = carMileage
    }

    func make(action: Actions) {
        switch action {
        case .openWindow:
            print("Window is opened")
        case .closeWindow:
            print("Window is closed")
        default:
            break
        }
    }
}



let firstCar = Car(carBrend: "TAYOTA", yearsOfProduction: 1998, trunkVolume: 100, carMileage: 0.0)

class SportCar: Car {
    var speedRecord: Int
    init(carBrend: String,yearsOfProduction: Int,trunkVolume: Int, carMileage:Double, speedRecord:Int) {
        self.speedRecord = speedRecord
        super.init(carBrend: carBrend, yearsOfProduction: yearsOfProduction, trunkVolume: trunkVolume, carMileage: carMileage)
    }
    override func make(action: Actions) {
        super.make(action: action)
        switch action {
        case .load:
            print("not supported")
        case .unload:
            print("not supported")
        default:
            break
        }
    }
}

let sportCar = SportCar(carBrend: "aoaoa", yearsOfProduction: 2021, trunkVolume: 0, carMileage: 0.0, speedRecord: 2000)
sportCar.make(action: .closeWindow)


class TrunkCar:Car {
    let maxCapacity: Int
    var loadCapacity: Int
    init(carBrend: String,yearsOfProduction: Int,trunkVolume: Int, carMileage:Double, maxCapacity:Int, loadCapacity: Int) {
        self.maxCapacity = maxCapacity
        self.loadCapacity = loadCapacity
        super.init(carBrend: carBrend, yearsOfProduction: yearsOfProduction, trunkVolume: trunkVolume, carMileage: carMileage)
    }
    override func make(action: Actions) {
        super.make(action: action)
        switch action {
        case .load(let value):
            if maxCapacity > loadCapacity + value {
                loadCapacity += value
            } else {
                print("Not enought space")
            }
        case .unload(let value):
            if loadCapacity >= value {
                loadCapacity -= value
            } else {
                print("Not enought filled")

            }
        default:
            break
        }
    }
}


