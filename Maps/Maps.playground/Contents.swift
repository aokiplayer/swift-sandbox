import Foundation

enum Category: String, CustomStringConvertible {
    var description: String {
        self.rawValue
    }
    
    case personal
    case business
}

struct Item: CustomStringConvertible {
    var description: String {
        """
        name: "\(self.name)", price: \(self.price), categories: \(self.categories ?? [])

        """
    }
    
    let name: String
    let price: Int
    let categories: [Category]?
}

let items: [Item] = [
    Item(name: "Suit", price: 15000, categories: [.business]),
    Item(name: "Pen", price: 400, categories: [.personal, .business]),
    Item(name: "Sea", price: 99999, categories: nil),
    Item(name: "Drink", price: 120, categories: [.personal]),
    Item(name: "Sky", price: 99999, categories:nil),
    Item(name: "Comic", price: 600, categories: [.personal])
]

print("""
      == Items ==========
      \(items)

      """
)

// map transforms each element in an Array.
let map = items.map { item in
    item.categories ?? []
}
print("""
      == map "item.categories ?? []" ==========
      \(map)

      """
)

// compactMap is a map that only collect non-nil values.
let compact = items.compactMap { item in
    item.categories
}
print("""
      == compactMap "item.categories" ==========
      \(compact)

      """
)

// flatMap flattens the inner Array.
let flat1 = items.flatMap { item in
    item.categories ?? []
}
print("""
      == flatMap "item.categories ?? []" ==========
      \(flat1)

      """
)

// This type of flatMap is deprecated. You should use compactMap.
let flat2 = items.flatMap { item in
    item.categories
}
print("""
      == flatMap "item.categories" ==========
      \(flat2)

      """
)
let a: Int? = 10
