import Cocoa

/*
 Class initializers in Swift are more complicated than struct initializers
 
If a child class has any custom initializers, it must always call the parent’s initializer after it has finished setting up its own properties, if it has any.
 
 Swift won’t automatically generate a memberwise initializer for classes. This applies with or without inheritance happening – it will never generate a memberwise initializer for you. So, you either need to write your own initializer, or provide default values for all the properties of the class.
 */

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        
        //Withput the next line swift would refuse to build our code. Swift wants us to do is provide Car with an initializer that includes both isElectric and isConvertible, but rather than trying to store isElectric ourselves we instead need to pass it on – we need to ask the super class to run its own initializer.
        
        super.init(isElectric: isElectric)
        //super is another one of those values that Swift automatically provides for us, similar to self: it allows us to call up to methods that belong to our parent class, such as its initializer. You can use it with other methods if you want; it’s not limited to initializers.
    }
}


let teslaX = Car(isElectric: true, isConvertible: false)

//If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.
