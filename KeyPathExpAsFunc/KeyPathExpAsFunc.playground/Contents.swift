import Foundation

// SE-0249: Key Path Expressions as Functions
// https://github.com/apple/swift-evolution/blob/master/proposals/0249-key-path-literal-function-expressions.md

struct Product {
    let name: String
    let price: Int
    var quantity: UInt
   
    var inStock: Bool {
        quantity > 0
    }
}

let products: [Product] = [
    .init(name: "Mac", price: 400_000, quantity: 10),
    .init(name: "iPhone", price: 150_000, quantity: 0),
    .init(name: "Watch", price: 60_000, quantity: 0),
    .init(name: "Pencil", price: 20_000, quantity: 5),
    .init(name: "iPad", price: 80_000, quantity: 20),
    .init(name: "Tag", price: 30_000, quantity: 0)
]

// クロージャで条件を指定
let inStockProducts = products
    .filter { $0.inStock }
    .map { $0.name }
print(inStockProducts)

// Key Path Expressions as Functions
// \Product.inStock が (Product) -> Bool の関数として扱われる
// \Product.name が (Product) -> String の関数として扱われる
let inStockProducts2 = products
    .filter(\.inStock)
    .map(\.name)
print(inStockProducts2)

// これは NG（関数型にキャストはできない）
//let exp1 = \Product.name as (Product) -> String

// こっちは OK（関数型へ代入はできる）
let exp2: (Product) -> String = \Product.name

let names = products.map(exp2)
print(names)
