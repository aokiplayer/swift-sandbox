//: # dynamicCallable の例 3
//: [Previous](@previous)
//: [Next](@next)
import Foundation

// 足し算をするためだけの構造体
@dynamicCallable
struct AddAction {
    // 引数はExpressibleByDictionaryLiteralに準拠した型とする
    // KeyValuePairs型なら、同じラベルの引数を複数指定できる（ディクショナリではキーを重複できない）
    public func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> [String: Int] {
        var sum = 0
        
        let groupedSum = Dictionary(grouping: args, by: { $0.key })
            .mapValues { values in
                values.compactMap { key, value in
                    value
                }
                .reduce(0, +)
            }

        return groupedSum
    }
}

let add = AddAction()

// メソッド名は省略でき、引数のラベルと個数は自由に設定できる
// 今回は引数をKeyValuePairs型にしているので、キーの重複もOK
let result1 = add(john: 3, mary: 5, mary: 2, john: 4, ben: 10, john: 8, ben: 9)
print("個人別の合計点数")
print(result1, terminator: "\n\n")

// メソッド名を記載した際には、引数はディクショナリとして渡す必要がある
// キーはStringなので、ダブルクォートで囲む
let result2 = add.dynamicallyCall(withKeywordArguments: [
    "john": 3, "mary": 5, "mary": 2, "john": 4, "ben": 10, "john": 8, "ben": 9
])
print("個人別の合計点数")
print(result2, terminator: "\n\n")
//: [Previous](@previous)
//: [Next](@next)
