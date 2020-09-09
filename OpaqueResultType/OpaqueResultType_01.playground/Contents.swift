import Foundation

class Person: CustomStringConvertible {
    var description: String {
        "\(name): \(age) years old."
    }

    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Employee: Person {
    override var description: String {
        """
        \(super.description)
         -> Salary: ¥\(salary)
        """
    }

    var salary: Int

    init(name: String, age: Int, salary: Int) {
        self.salary = salary
        super.init(name: name, age: age)
    }
}

func makeEmployee1() -> some Person {
    Employee(name: "Jiro Yamada", age: 53, salary: 125_000)
}

func makeEmployee2() -> some Person {
    Employee(name: "Goro Kawada", age: 27, salary: 657_000)
}

var e1 = makeEmployee1()   // The actual type of return value is "Employee", but the type of e1 is "some Person."
var e2 = makeEmployee2()   // The actual type of return value is "Employee", but the type of e2 is "some Person."
print(e1)
print(e2)

// Opaque Result Type を利用してるので、 makeEmployee1 と makeEmployee2 の返す実体の型が同じ Employee で
// あっても、 e1 と e2 については互いに代入できない（内部実装の変更で返される型が変わるかもなので）.
// e1 と e2 の型は "some Person" であり、 "Person" ではない（"some Person" は、「Person の何らかのサブクラス」）.
//
// The value of e2 cannot be assigned to e1 because the type "some Person" only means "This is a subclass type of Person."
// "some Person" type is not only able to be "Employee," can be Person's other subclasses.
//
//e1 = e2   // Compile error
//print(e1)
