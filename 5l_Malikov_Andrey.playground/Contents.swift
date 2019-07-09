import UIKit

/*
 1.    Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2.    Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3.    Создать два класса, имплементирующих протокол «Car»: trunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4.    Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
 5.    Создать несколько объектов каждого класса. Применить к ним различные действия.
 6.    Вывести сами объекты в консоль.
*/
enum Manufacturer: String { // Не понял, как поместить в тело класса. Протокол выдает ошибку (неизвестный тип)
    case MercedesBenz = "Mercedes-Benz"
    case Volvo = "Volvo"
    case Mitsubishi = "Mitsubishi"
    case Ford = "Ford"
}

enum BodyColor: String {
    case red = "красный"
    case orange = "оранжевый"
    case green = "зеленый"
    case blue = "синий"
    case black = "черный"
    case white = "белый"
}

protocol Car {
    var manufacturer: Manufacturer {get}
    var year: Int {get}
    var color: BodyColor {get}
    var engineStarted: Bool {get set}
    var doorsOpened: Bool {get set}
    
    func startEngine()
    func stopEngine()
}

class AnyCar: Car {
    let manufacturer: Manufacturer
    let year: Int
    let color: BodyColor
    var engineStarted: Bool = false
    var doorsOpened: Bool = false
    
    func startEngine() {
        if !self.engineStarted {
            self.engineStarted = true
        }
    }
    
    func stopEngine() {
        if self.engineStarted {
            self.engineStarted = false
        }
    }
    
    init(manufacturer: Manufacturer, year: Int, color: BodyColor) {
        self.manufacturer = manufacturer
        self.year = year
        self.color = color
    }
}

extension Car {
    var age: Int {
        get {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yyyy"
            return Int(dateformatter.string(from: Date()))! - year
        }
    }
}

extension AnyCar {
    func openDoors() {
        if !self.doorsOpened {
            self.doorsOpened = true
        }
    }
    func closeDoors() {
        if self.doorsOpened {
            self.doorsOpened = false
        }
    }
}

class sportCar: AnyCar {
    let horsePower: Int
    var wheelRadius: Int
    init(manufacturer: Manufacturer, year: Int, color: BodyColor, horsePower: Int, wheelRadius: Int) {
        self.horsePower = horsePower
        self.wheelRadius = wheelRadius
        super.init(manufacturer: manufacturer, year: year, color: color)
    }
}

class trunkCar: AnyCar {
    let capacity: Int
    var loaded: Int = 0
    init(manufacturer: Manufacturer, year: Int, color: BodyColor, capacity: Int) {
        self.capacity = capacity
        super.init(manufacturer: manufacturer, year: year, color: color)
    }
}

extension trunkCar {
    func load(volume: Int) {
        if self.capacity >= self.loaded + volume {
            self.loaded += volume
        } else {
            self.loaded = self.capacity
        }
    }
    func unLoad(volume: Int) {
        if volume > self.loaded {
            self.loaded = 0
        } else {
            self.loaded -= volume
        }
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "\(manufacturer), \(year) года выпуска, возраст (лет) - \(age), цвет - \(color.rawValue), мощность - \(horsePower) л.с., колеса R\(wheelRadius)\n" + (engineStarted ? "Двигатель работает, " : "Двигатель заглушен, ") + (doorsOpened ? "двери открыты" : "двери закрыты") + "\n"
    }
    func printDescription () {
        print(description)
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return "\(manufacturer), \(year) года выпуска, возраст (лет) - \(age), цвет - \(color.rawValue), загружено \(loaded) из \(capacity)\n" + (engineStarted ? "Двигатель работает, " : "Двигатель заглушен, ") + (doorsOpened ? "двери открыты" : "двери закрыты") + "\n"
    }
    func printDescription () {
        print(description)
    }
}

var car1 = sportCar(manufacturer: .MercedesBenz, year: 2015, color: .black, horsePower: 300, wheelRadius: 19)
car1.manufacturer
car1.year
car1.color
car1.engineStarted
car1.stopEngine()
car1.age
car1.openDoors()
car1.doorsOpened
var car2 = trunkCar(manufacturer: .Mitsubishi, year: 2018, color: .orange, capacity: 1000)
car2.manufacturer
car2.age
car2.startEngine()
car2.load(volume: 500)
car2.load(volume: 1000)
car2.loaded
car2.unLoad(volume: 600)
car2.loaded
car2.unLoad(volume: 600)
car2.loaded
car1.printDescription()
car2.printDescription()


