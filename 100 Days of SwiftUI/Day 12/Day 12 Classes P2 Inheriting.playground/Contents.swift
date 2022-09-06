import Cocoa

/*
 Swift lets us create classes by basing them on existing classes, which is a process known as inheritance. When one class inherits functionality from another class (its “parent” or “super” class), Swift will give the new class access (the “child class” or “subclass”) to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves.
 
 
 To make one class inherit from another, write a colon after the child class’s name, then add the parent class’s name
 */

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

//We could make two subclasses of Employee, each of which will gain the hours property and initializer:

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

/*
 Notice how those two child classes can refer directly to hours – it’s as if they added that property themselves, except we don’t have to keep repeating ourselves.
 
 Each of those classes inherit from Employee, but each then adds their own customization. So, if we create an instance of each and call work(), we’ll get a different result.
 */

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

//As well as sharing properties, you can also share methods, which can then be called from the child classes

let novall = Developer(hours: 8)
novall.printSummary()

/*
 Things get a little more complicated when you want to change a method you inherited. For example, we just put printSummary() into Employee, but maybe one of those child classes wants slightly different behavior.

 This is where Swift enforces a simple rule: if a child class wants to change a method from a parent class, you must use override in the child class’s version. This does two things:

 --If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
 --If you use override but your method doesn’t actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake.
 So, if we wanted developers to have a unique printSummary() method, we’d add this to the Developer class:
 */

class DeveloperOveridrExample: Employee {
    
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummmary(){
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")

    }
}
