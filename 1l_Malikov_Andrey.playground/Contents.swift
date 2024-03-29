import UIKit

// ------------------------------------------------------
// 1. Решение квадратного уравнения.
// a * x^2 + b * x + c = 0

let a: Double = 1
let b: Double = 2
let c: Double = 1

let D: Double = pow(b,2) - 4 * a * c

if (D >= 0) {
    let x1 = (-b + sqrt(D)) / (2 * a)
    let x2 = (-b - sqrt(D)) / (2 * a)
    if (D == 0) {
        print ("X = \(x1)")
    } else {
        print ("X1 = \(x1)")
        print ("X2 = \(x2)")
    }
} else {
    print ("Корней на множестве действительных чисел нет")
}

// ------------------------------------------------------
// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let kat1: Double = 1
let kat2: Double = 1

let gip = sqrt(pow(kat1,2) + pow(kat2,2))
print("Гипотенуза = \(gip)")

let S = kat1 * kat2 / 2
print("Площадь = \(S)")

let P = kat1 + kat2 + gip
print("Периметр = \(P)")


// ------------------------------------------------------
// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var summ: Int = 100000
let rate: Double = 0.07

for _ in 1...5 {
    summ = Int(Double(summ) * (1 + rate))
}
print("Сумма вклада после 5 лет \(summ)")

