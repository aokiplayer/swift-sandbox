//: # dynamicCallable の例 2
//: [Previous](@previous)
//: [Next](@next)
import Foundation

// 足し算をするためだけの構造体
@dynamicCallable
struct AddAction {
    // 引数はExpressibleByDictionaryLiteralに準拠した型とする
    public func dynamicallyCall(withKeywordArguments args: [String: Int]) -> Int {
        var sum = 0
        
        print("[引数リスト]")
        
        for (name, value) in args {
            print("  \(name), \(value)")
            sum += value
        }
        
        return sum
    }
}

let add = AddAction()

// メソッド名は省略でき、引数のラベルと個数は自由に設定できる
let result1 = add(a: 10, b: 20, c: 30)
print("合計: \(result1)", terminator: "\n\n")

// メソッド名は省略でき、引数のラベルと個数は自由に設定できる
let result2 = add(x: 5, y: 10)
print("合計: \(result2)", terminator: "\n\n")

// メソッド名を記載した際には、引数はディクショナリとして渡す必要がある
// キーはStringなので、ダブルクォートで囲む
let result3 = add.dynamicallyCall(withKeywordArguments: ["num1": 20, "num2": 40])
print("合計: \(result3)", terminator: "\n\n")
//: [Previous](@previous)
//: [Next](@next)
