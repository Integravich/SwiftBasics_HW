import UIKit

// 1. Написать функцию, которая определяет, четное число или нет.

func isItEvenNumber(n: Int)->Bool{
    if n % 2 == 0 {
        //print("\(n) - четное число")
        return true
    }
    else {
        //print("\(n) - нечетное число")
        return false
    }
}
var check: Bool
check = isItEvenNumber(n: 4)
check = isItEvenNumber(n: 5)


// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isNumberCanBeDivided(n: Int, div: Int)->Bool{
    if n % div == 0 {
        //print("\(n) делится на \(div) без остатка")
        return true
    }
    else {
        //print("\(n) не делится на \(div) без остатка")
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


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var i: Int = 0
var lasti: Int = array.count - 1
while i <= lasti {
    if isItEvenNumber(n: array[i]) || !isNumberCanBeDivided(n: array[i], div: 3) {
        array.remove(at: i)
        i -= 1
        lasti -= 1
    }
    i += 1
}

var checka = array


// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
// Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func addNextFiboNumber(array: [Double]) -> [Double] {
    var array2 = array
    switch array.count {
    case 0:
        array2.append(0)
        return array2
    case 1:
        array2.append(1)
        return array2
    default:
        let n = array.count
        array2.append(array[n-1] + array[n-2])
        return array2
    }
}

var arrayFibo = [Double]()
for _ in 0...99 {
    arrayFibo = addNextFiboNumber(array: arrayFibo)
    //print(arrayFibo[arrayFibo.count-1])
}


// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//
// a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
// b. Пусть переменная p изначально равна двум — первому простому числу.
// c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
// d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
// e. Повторять шаги c и d, пока возможно.

var arrayPrimeNumbers = [Int]()
arrayPrimeNumbers.append(2) //; print(arrayPrimeNumbers[0])
var nextNumber = 3
var isPrime: Bool
while arrayPrimeNumbers.count < 100 {
    isPrime = true
    var i = 0
    while (i < arrayPrimeNumbers.count) && isPrime {
        if nextNumber % arrayPrimeNumbers[i] == 0 {
            isPrime = false
        }
        i += 1
    }
    if isPrime {
        arrayPrimeNumbers.append(nextNumber) //; print(nextNumber)
    }
    nextNumber += 1
}


