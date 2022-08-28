import Cocoa

//Structs can have two kinds of property: a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed

//This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties, but work like functions.

struct EmployeeOriginal {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
//vacationRemaining is a computed property
    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}


var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)

//Although vacationRemaining works like any other property right now. We can't write to it because we haven't told Swift how to handle that. To do so, we need to create getters and setters. That's just a fancy way of saying “code that reads” and “code that writes” respectively.

//In this case the getter is simple enough, because it’s just our existing code. But the setter is more interesting – if you set vacationRemaining for an employee, do you mean that you want their vacationAllocated value to be increased or decreased, or should vacationAllocated stay the same and instead we change vacationTaken?

//Assuming vacation allocated is increasing/decreasing then the getter and setters will be like this
struct EmployeeGetterSetter {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    

    var vacationRemaining: Int {
        get{
        vacationAllocated - vacationTaken
        }
        
        set{
            vacationAllocated = vacationTaken + newValue
            //newValue is a special variable for setters, so it's automatically created
        }
        
        
    }
}
