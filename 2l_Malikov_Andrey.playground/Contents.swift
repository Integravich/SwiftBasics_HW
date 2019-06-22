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


