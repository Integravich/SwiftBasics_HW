import UIKit

//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum Position {
    case juniorSpecialist, specialist, seniorSpecialist
}

class Person {
    let name: String
    let birth: Int
    var salary: Int = 0
    var position: Position? = nil
    init(name: String, birth: Int) {
        self.name = name
        self.birth = birth
    }
}

enum DepartmentError: Error {
    case noEmployees
    case noPosition(tabNumber: Int, name: String)
    case noTabNumber(tabNumber: Int)
}

class Department {
    var name: String
    var employees: [Int: Person] = [:] // [табельный номер : сотрудник]
    static var nextTabNumber: Int = 1
    
    // средняя зарплата
    func averageSalary() throws -> Int {
        guard self.employees.count > 0 else {
            throw DepartmentError.noEmployees
        }
        var summ = 0
        for (_, employee) in employees {
            summ += employee.salary
        }
        return summ / employees.count
    }
    
    // список сотрудников
    func listOfEmployeers() throws {
        for (tabNumber, employee) in employees {
            guard employee.position != nil else {
                throw DepartmentError.noPosition(tabNumber: tabNumber, name: employee.name)
            }
            print("Таб. номер: \(tabNumber), имя: \(employee.name), год рождения: \(employee.birth), должность: \(employee.position!), оклад:  \(employee.salary) ")
        }
    }
    
    // прием на работу
    func hire(_ person: Person, toPosition position: Position, withSalary salary: Int) {
        person.position = position
        person.salary = salary
        self.employees[Department.nextTabNumber] = person
        print("Сотрудник принят на работу. Таб. номер: \(Department.nextTabNumber), имя: \(person.name)")
        Department.nextTabNumber += 1
    }
    
    // увольнение
    func fire(employeeWithTabNumber tabNumber: Int) throws {
        guard self.employees[tabNumber] != nil else {
            throw DepartmentError.noTabNumber(tabNumber: tabNumber)
        }
        let name = self.employees[tabNumber]!.name
        self.employees.removeValue(forKey: tabNumber)
        print("Сотрудник \(name) с таб. номером \(tabNumber) уволен")
    }
    
    init(name: String) {
        self.name = name
    }
}

// создаем людей
var p1 = Person(name: "Andrey", birth: 1990)
var p2 = Person(name: "Bob", birth: 1995)
var p3 = Person(name: "Ann", birth: 1993)
var p4 = Person(name: "Alice", birth: 1985)
var p5 = Person(name: "Alan", birth: 1984)

// создаем подразделение
var department1 = Department(name: "Department1")

// принимаем на работу сотрудников
department1.hire(p1, toPosition: .juniorSpecialist, withSalary: 1000)
department1.hire(p2, toPosition: .specialist, withSalary: 1500)
department1.hire(p4, toPosition: .seniorSpecialist, withSalary: 2100)

// пытаемся посчитать среднюю зарплату
do {
    let avg = try department1.averageSalary()
    print("Средняя зарплата: \(avg)")
} catch DepartmentError.noEmployees {
    print("Ошибка расчета средней зарплаты. В отделе нет сотрудников!")
}

// пытаемся вывести список сотрудников
//p1.position = nil // моделируем ошибку
do {
    try department1.listOfEmployeers()
} catch DepartmentError.noPosition(tabNumber: let tabNumber, name: let name) {
    print("Ошибка! Сотрудник \(name)(табельный номер: \(tabNumber)) не назначен на должность")
}

//пытаемся уволить
do {
    try department1.fire(employeeWithTabNumber: 10)
} catch DepartmentError.noTabNumber(tabNumber: let tabNumber) {
    print("Ошибка! Сотрудник с табельным номером \(tabNumber)) не обнаружен")
}

