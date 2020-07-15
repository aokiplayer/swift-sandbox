import Foundation

struct Product: CustomStringConvertible {
    var description: String {
        "(\(self.name), $\(self.price), \(self.category))"
    }
    
    var name: String
    var price: Int
    var category: Category
    
    enum Category: String, CustomStringConvertible {
        var description: String {
            "\(self.rawValue)"
        }
        
        case food
        case drink
        case other
    }
}

// Array of Product
var products: [Product] = [
    Product(name: "Fried Potato", price: 24, category: .food),
    Product(name: "Water", price: 12, category: .drink),
    Product(name: "Dish", price: 40, category: .other),
    Product(name: "Chai", price: 5, category: .drink),
    Product(name: "Fork", price: 56, category: .other),
    Product(name: "Bread", price: 35, category: .food),
    Product(name: "Noodle", price: 80, category: .food),
    Product(name: "Coffee", price: 98, category: .drink),
]

print(
    """

    Elements of Array
    ===========================================
    """
)
products.forEach { print($0) }

// Grouping by Category
var groupedProducts: [Product.Category: [Product]] = Dictionary(
    grouping: products,
    by: { $0.category }
)

print(
    """
    
    Grouping by Category
    ===========================================
    """
)
groupedProducts.forEach {
    print(
        """
        \($0.key.rawValue)
            \($0.value)
        """
    )
}
