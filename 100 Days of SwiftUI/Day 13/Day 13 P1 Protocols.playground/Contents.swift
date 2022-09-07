import Cocoa

//Protocols are like blueprints in Swift: they let us define what kinds of functionality we expect a data type to support, and Swift ensures that the rest of our code follows those rules.

//They let us define a series of properties and methods that we want to use. They don’t implement those properties and methods – they don’t actually put any code behind it – they just say that the properties and methods must exist

protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*
 Let’s break that down:

-- To create a new protocol we write protocol followed by the protocol name. This is a new type, so we need to use camel case starting with an uppercase letter.
-- Inside the protocol we list all the methods we require in order for this protocol to work the way we expect.
-- These methods do not contain any code inside – there are no function bodies provided here. Instead, we’re specifying the method names, parameters, and return types. You can also mark methods as being throwing or mutating if needed.
 
 
 Now we can design types that work with that protocol. This means creating new structs, classes, or enums that implement the requirements for that protocol, which is a process we call adopting or conforming to the protocol.
 
 
 The protocol doesn’t specify the full range of functionality that must exist, only a bare minimum. This means when you create new types that conform to the protocol you can add all sorts of other properties and methods as needed.
 
 */


struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}




func commute(distance: Int, using vehicle: Vehicle) {
    //We’re saying this function can be called with any type of data, as long as that type conforms to the Vehicle protocol. The body of the function doesn’t need to change, because Swift knows for sure that the estimateTime() and travel() methods exist.
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)



struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

//As well as methods, you can also write protocols to describe properties that must exist on conforming types. To do this, write var, then a property name, then list whether it should be readable and/or writeable.

protocol VehicleWithProperties {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*That adds two properties:

--A string called name, which must be readable. That might mean it’s a constant, but it might also be a computed property with a getter.
--An integer called currentPassengers, which must be read-write. That might mean it’s a variable, but it might also be a computed property with a getter and setter.

 Type annotation is required for both of them, because we can’t provide a default value in a protocol, just like how protocols can’t provide implementations for methods.

 */


struct CarProp: VehicleWithProperties {
    
    let name = "Car"
    var currentPassengers = 1
    
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}


struct BicycleProp: VehicleWithProperties {
    
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

//So now our protocol requires two methods and two properties, meaning that all conforming types must implement those four things in order for our code to work. This in turn means Swift knows for sure that functionality is present, so we can write code relying on it.

func getTravelEstimates(using vehicles: [VehicleWithProperties], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}


let carProp: VehicleWithProperties = CarProp()
let bikeProp: VehicleWithProperties = BicycleProp()


getTravelEstimates(using: [carProp, bikeProp], distance: 150)



/*
 As well as accepting protocols as parameters, you can also return protocols from a function if needed.

 Tip: You can conform to as many protocols as you need, just by listing them one by one separated with a comma. If you ever need to subclass something and conform to a protocol, you should put the parent class name first, then write your protocols afterwards.
 */
