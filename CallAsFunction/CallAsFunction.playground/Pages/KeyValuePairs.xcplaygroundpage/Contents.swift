//: # KeyValuePairs の例
//: [Previous](@previous)
import Foundation

// KeyValuePairsで、重複したキーの値を保持
let pairs: KeyValuePairs<String, Int> = [
    "a": 10,
    "a": 20,
    "b": 5,
    "b": 3,
    "a": 10,
    "b": 7,
]

print("キーに重複のあるKeyValuePairs")
print(pairs, terminator: "\n\n")

// 元のKeyValuePairsの、キーごとにグループ化したディクショナリを作成
let groupedDict = Dictionary(grouping: pairs, by: { $0.key })

print("キーごとのグループ化")
print(groupedDict, terminator: "\n\n")

// キーごとにグループ化したディクショナリの値（これもディクショナリ）の各要素から、その値部分を合計
let result = groupedDict.mapValues { values in
    values.compactMap { key, value in
        value
    }.reduce(0, +)
}

print("キーごとの合計")
print(result, terminator: "\n\n")
//: [Previous](@previous)
