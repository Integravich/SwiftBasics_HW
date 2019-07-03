import UIKit

/*
 1.    Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2.    Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3.    Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
 4.    В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5.    Создать несколько объектов каждого класса. Применить к ним различные действия.
 6.    Вывести значения свойств экземпляров в консоль.
 */

class Car {
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
    
    enum Transmission {
        case automatic, manual
    }
    
    enum BodyColor: String {
        case red = "красный"
        case orange = "оранжевый"
        case green = "зеленый"
        case blue = "синий"
        case black = "черный"
        case white = "белый"
    }
    
    let manufacturer: Manufacturer
    let year: Int
    let color: BodyColor
    let transmission: Transmission
    var age: Int {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy"
            return Int(dateformatter.string(from: Date()))! - year
        }
    }
    var engineStatus: Engine = .stopped
    var doorsStatus: OpenClose = .closed
    var windowsStatus: OpenClose = .closed
    static var countSuper: Int = 0
    
    func startEngine() {
        self.engineStatus = .started
    }
    
    func stopEngine() {
        self.engineStatus = .stopped
    }
    
    func info() {
        print("\(self.manufacturer.rawValue) \(self.year)")
        print("Цвет \(self.color.rawValue)")
        print("Возраст (лет) \(self.age)")
        self.transmission == .automatic ? print("Коробка автомат") : print("Коробка ручная")
        self.engineStatus == .stopped ? print("Двигатель заглушен") : print("Двигатель работает")
        self.doorsStatus == .closed ? print("Двери закрыты") : print("Двери открыты")
        self.windowsStatus == .closed ? print("Окна закрыты") : print("Окна открыты")
    }
    
    init(manufacturer: Manufacturer, year: Int, color: BodyColor, transmission: Transmission) {
        self.manufacturer = manufacturer
        self.year = year
        self.color = color
        self.transmission = transmission
        Car.countSuper += 1
    }
}

class SportCar: Car {
    enum Lights {
        case xenon, LED
    }
    
    let lights: Lights
    let horsePower: Int
    var wheelsRadius: Int
    static var count: Int = 0
    
    override func info() {
        super.info()
        print("Мощность \(self.horsePower) лс")
        self.lights == .xenon ? print("Фары ксенон") : print("Фары светодиодные")
        print("Колеса R\(self.wheelsRadius)\n")
    }
    
    init(manufacturer: Manufacturer, year: Int, color: BodyColor, transmission: Transmission, horsePower: Int, lights: Lights, wheelsRadius: Int) {
        self.horsePower = horsePower
        self.lights = lights
        self.wheelsRadius = wheelsRadius
        super.init(manufacturer: manufacturer, year: year, color: color, transmission: transmission)
        SportCar.count += 1
    }
}

class TruckCar: Car {
    let cargoCapacity: Int
    var cargoLoad: Int = 0
    static var count = 0
    
    override func info() {
        super.info()
        print("Загружено \(self.cargoLoad) из \(self.cargoCapacity) кг\n")
    }
    
    func load(volume: Int) {
        if self.cargoLoad + volume > self.cargoCapacity {
            self.cargoLoad = self.cargoCapacity
        } else {
            self.cargoLoad += volume
        }
    }
    
    func unLoad(volume: Int) {
        if self.cargoLoad - volume < 0 {
            self.cargoLoad = 0
        } else {
            self.cargoLoad -= volume
        }
    }
    
    init(manufacturer: Manufacturer, year: Int, color: BodyColor, transmission: Transmission, cargoCapacity: Int) {
        self.cargoCapacity = cargoCapacity
        super.init(manufacturer: manufacturer, year: year, color: color, transmission: transmission)
        TruckCar.count += 1
    }
}

var sportCar1 = SportCar(manufacturer: .MercedesBenz, year: 2018, color: .black, transmission: .automatic, horsePower: 300, lights: .LED, wheelsRadius: 19)
sportCar1.info()
SportCar.count

var truckCar1 = TruckCar(manufacturer: .Volvo, year: 2019, color: .green, transmission: .automatic, cargoCapacity: 10000)
TruckCar.count
Car.countSuper

truckCar1.startEngine()
truckCar1.load(volume: 5000)
truckCar1.windowsStatus = .opened
truckCar1.info()
