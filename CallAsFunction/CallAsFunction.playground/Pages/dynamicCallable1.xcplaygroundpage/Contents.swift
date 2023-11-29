//: # dynamicCallable の例 1
//: [Previous](@previous)
//: [Next](@next)
import Foundation

// 足し算をするためだけの構造体
@dynamicCallable
struct AddAction {
    // 引数はExpressibleByArrayLiteralに準拠した型とする
    public func dynamicallyCall(withArguments args: [Int]) -> Int {
        return args.reduce(0, +)
    }
}

let add = AddAction()

// 以下は add.dynamicallyCall(withArguments: [10, 20, 30]) の省略形
// この際、引数の配列は展開した状態で渡せる
let result1 = add(10, 20, 30)
print(result1)

// メソッド名を記載した際には、引数は配列として渡す必要がある
let result2 = add.dynamicallyCall(withArguments: [10, 20, 30, 40])
print(result2)
//: [Previous](@previous)
//: [Next](@next)
