import Foundation

// 複数の末尾クロージャについて
// https://docs.swift.org/swift-book/LanguageGuide/Closures.html#ID102

func calc(_ a: Int,
          _ b: Int,
          exp1: (Int, Int) -> Int,
          exp2: (Int, Int) -> Int,
          exp3: (Int, Int) -> Int,
          exp4: (Int, Int) -> Int) -> (Int, Int, Int, Int) {
    print(a, b)
    return (exp1(a, b), exp2(a, b), exp3(a, b), exp4(a, b))
}

// 末尾クロージャが続く場合
// 最初の末尾クロージャのラベルは省略する
// 以降のラベルは記述する
let result = calc(1000, 50) { a, b in
    a + b
} exp2: { a, b in
    a - b
} exp3: { a, b in
    a * b
} exp4: { a, b in
    a / b
}

print(result)
