import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.

func isItEvenNumber(n: Int)->Bool{
    if n % 2 == 0 {
        print("\(n) - четное число")
        return true
    }
    else {
        print("\(n) - нечетное число")
        return false
    }
}
var check: Bool
check = isItEvenNumber(n: 4)
check = isItEvenNumber(n: 5)


// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isNumberCanBeDivided(n: Int, div: Int)->Bool{
    if n % div == 0 {
        print("\(n) делится на \(div) без остатка")
        return true
    }
    else {
        print("\(n) не делится на \(div) без остатка")
        return false
    }
}
check = isNumberCanBeDivided(n: 6, div: 3)
check = isNumberCanBeDivided(n: 6, div: 4)


// 3. Создать возрастающий массив из 100 чисел.

var array = [Int]()
for i in 0...99 {
    array.append(i)
}
