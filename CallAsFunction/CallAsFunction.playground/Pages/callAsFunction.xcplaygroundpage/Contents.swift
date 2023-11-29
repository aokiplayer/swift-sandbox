//: # CallAsFunction の例
//: [Next](@next)
import Foundation

// 足し算をするためだけの構造体
struct AddAction {
    public func callAsFunction(_ number1: Int, with number2: Int) -> Int {
        return number1 + number2
    }
}

let add = AddAction()

// 以下は add.callAsFunction(10, with: 20) の省略形
let result1 = add(10, with: 20)
print(result1)

// もちろん、メソッド名を書いても動作する
let result2 = add.callAsFunction(50, with: 100)
print(result2)
//: [Next](@next)
