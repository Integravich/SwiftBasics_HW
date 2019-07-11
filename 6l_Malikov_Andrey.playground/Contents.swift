import UIKit

/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

struct Queue<T: Comparable> {
    private var elements: [T] = []
    
    mutating func add(_ element: T) {
        elements.append(element)
    }
    mutating func remove() -> T? {
        return elements.removeFirst()
    }
    func printAll() {
        self.elements.forEach {
            print($0)
        }
        print("\n")
    }
    mutating func sortQ() {
        self.elements.sort { $0 < $1 }
    }
    mutating func reverseQ() {
        var start = 0
        var end = self.elements.count - 1
        var temp: T
        while (start < end) {
            temp = self.elements[start]
            self.elements[start] = self.elements[end]
            self.elements[end] = temp
            start += 1
            end -= 1
        }
    }
    subscript (index: Int) -> T? {
        if (index < 0) || (index > self.elements.count - 1) {
            return nil
        } else {
            return self.elements[index]
        }
    }
}

var q = Queue<Int>()
q.add(4)
q.add(3)
q.add(2)
q.add(1)
q.printAll()
q.sortQ()
q.printAll()
q.reverseQ()
q.printAll()
q.remove()
q.reverseQ()
q.printAll()
q[1]
q[-100]

var q2 = Queue<Double>()
q2.add(12.12)
q2.add(13.13)
q2.add(14.14)
q2.reverseQ()
q2.printAll()


