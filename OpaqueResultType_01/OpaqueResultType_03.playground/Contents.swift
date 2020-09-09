import Foundation

func makeEquatableObject1() -> some Equatable {
    arc4random_uniform(3)
}

func makeEquatableObject2() -> some Equatable {
    switch arc4random_uniform(3) {
    case 0:
        return "Apple"
    case 1:
        return "Banana"
    default:
        return "Orange"
    }
}

let anEquatable1 = makeEquatableObject1()
let anEquatable2 = makeEquatableObject2()

// Both object is "some Equatable", but the expression below occurs compile error.
//print("\(anEquatable1) == \(anEquatable2) ? \(anEquatable1 == anEquatable2)")

let anEquatable3 = makeEquatableObject1()
let anEquatable4 = makeEquatableObject2()
print("\(anEquatable1) == \(anEquatable3) ? \(anEquatable1 == anEquatable3)")
print("\(anEquatable2) == \(anEquatable4) ? \(anEquatable2 == anEquatable4)")
