import Cocoa

//Protocol extensions: we can extend a whole protocol to add method implementations, meaning that any types conforming to that protocol get those methods.


extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}
/*
 we just added isNotEmpty to arrays, but what about sets and dictionaries? Sure, we could repeat ourself and copy the code into extensions for those, but there’s a better solution: Array, Set, and Dictionary all conform to a built-in protocol called Collection, through which they get functionality such as contains(), sorted(), reversed(), and more.

 This is important, because Collection is also what requires the isEmpty property to exist. So, if we write an extension on Collection, we can still access isEmpty because it’s required. This means we can change Array to Collection in our code to get this:
 */

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

//By extending the protocol we’re adding functionality that would otherwise need to be done inside individual structs. This is really powerful, and leads to a technique Apple calls protocol-oriented programming – we can list some required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed.


protocol Person {
    var name: String { get }
    func sayHello()
}

//That means all conforming types must add a sayHello() method, but we can also add a default implementation of that as an extension like this:

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

//And now conforming types can add their own sayHello() method if they want, but they don’t need to – they can always rely on the one provided inside our protocol extension.

//So, we could create an employee without the sayHello() method:

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()
