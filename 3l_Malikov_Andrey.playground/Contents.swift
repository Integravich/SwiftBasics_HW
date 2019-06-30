import UIKit

/*
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 
 6. Вывести значения свойств экземпляров в консоль.
 */

enum Manufacturer: String {
    case MercedesBenz = "Mercedes-Benz"
    case Volvo = "Volvo"
    case Mitsubishi = "Mitsubishi"
    case Ford = "Ford"
}

enum Engine {
    case started, stopped
}

enum OpenClose {
    case opened, closed
}

struct Car {
    let manufacturer: Manufacturer
    let year: Int
    var engineStatus: Engine
    var doorsStatus: OpenClose
    var windowsStatus: OpenClose
}

struct Truck {
    let manufacturer: Manufacturer
    let year: Int
    var age: Int {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy"
            return Int(dateformatter.string(from: Date()))! - year
        }
    }
    let cargoCapacity: Int
    var cargoLoad: Int = 0
    var engineStatus: Engine = .stopped {
        didSet {
            if (engineStatus == .started) && (doorsStatus == .opened) {
                print("Перед началом движения закройте двери\n")
            }
        }
    }
    var doorsStatus: OpenClose = .closed
    var windowsStatus: OpenClose = .closed
    
    func info() {
        print("\(self.manufacturer.rawValue) \(self.year)")
        print("Возраст (лет) \(self.age)")
        print("Загружено \(self.cargoLoad) из \(self.cargoCapacity)")
        self.engineStatus == .stopped ? print("Двигатель заглушен") : print("Двигатель работает")
        self.doorsStatus == .closed ? print("Двери закрыты") : print("Двери открыты")
        self.windowsStatus == .closed ? print("Окна закрыты\n") : print("Окна открыты\n")
    }
    
    mutating func load(volume: Int) {
        if self.cargoLoad + volume > self.cargoCapacity {
            self.cargoLoad = self.cargoCapacity
        } else {
            self.cargoLoad += volume
        }
    }
    
    mutating func unLoad(volume: Int) {
        if self.cargoLoad - volume < 0 {
            self.cargoLoad = 0
        } else {
            self.cargoLoad -= volume
        }
    }
    
    mutating func startEngine() {
        self.engineStatus = .started
    }
    
    mutating func stopEngine() {
        self.engineStatus = .stopped
    }
    
    init(manufacturer: Manufacturer, year: Int, cargoCapacity: Int) {
        self.manufacturer = manufacturer
        self.year = year
        self.cargoCapacity = cargoCapacity
    }
}

var truck1 = Truck(manufacturer: .Volvo, year: 2015, cargoCapacity: 100)
truck1.load(volume: 200)
truck1.unLoad(volume: 50)
truck1.doorsStatus = .opened
truck1.startEngine()
truck1.info()

var truck2 = Truck(manufacturer: .MercedesBenz, year: 2010, cargoCapacity: 200)
truck2.load(volume: 250)
truck2.windowsStatus = .opened
truck2.startEngine()
truck2.info()

