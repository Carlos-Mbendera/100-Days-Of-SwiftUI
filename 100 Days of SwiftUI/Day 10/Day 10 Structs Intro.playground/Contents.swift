import Cocoa

//Structs let us create our own custom complex data types with their own functions and variables.

//For example,

struct Album{
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
         print("\(title) (\(year)) by \(artist)")
    }
}
//That creates a new type called Album, with two string constants called title and artist, plus an integer constant called year
//It also has function that summarises the data inside the struct

//Data Types always have a Capital first letters. Same for our Strut and String, Int, Bool.

//At this point, Album is just like String or Int – we can make them, assign values, copy them, and so on.

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//This is nice and all but what about when we have variables inside the struct that we want to change

//For example, in employee below, we have vacationRemaining as a var

struct Employee{
    let name: String
    var vacationRemaining: Int
    
   mutating func takeVacation(days: Int){
        
        if days > vacationRemaining{
            
            //NOW before, I wrote mutating above, this -= is throwing an error. That's because the function changes data inside the struct. This would be fine if this data type is assigned to a variable. However, if the struct is a constant. Then errors would occur. Hence, when chaning data inside a function in a struct it has to be labeled mutating.
            vacationRemaining -= days
            
                     print("I'm going on vacation!")
                     print("Days remaining: \(vacationRemaining)")
                 } else {
                     print("Oops! There aren't enough days remaining.")
                 }
        
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

/* Let's go over some terms we're going to use throughout this topic
 
-- Variables and constants that belong to structs are called properties.
-- Functions that belong to structs are called methods.
-- When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
-- When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
 
 */


var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
//That last one might seem a bit odd at first, because we’re treating our struct like a function and passing in parameters. Swift silently created a special function inside the struct called init(), using all the properties of the struct as its parameters.


//Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties.


struct EmployeeDefault{
    let name: String
    var vacationRemaining: Int = 14
    
   mutating func takeVacation(days: Int){
        if days > vacationRemaining{
            vacationRemaining -= days
                     print("I'm going on vacation!")
                     print("Days remaining: \(vacationRemaining)")
                 } else {
                     print("Oops! There aren't enough days remaining.")
        }
    }
}

//Then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, making both of these valid:

let kane = EmployeeDefault(name: "Lana Kane")
let poovey = EmployeeDefault(name: "Pam Poovey", vacationRemaining: 35)
