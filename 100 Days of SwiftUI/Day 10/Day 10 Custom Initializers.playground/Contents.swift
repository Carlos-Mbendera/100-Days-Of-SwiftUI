import Cocoa

//Initializers are specialized methods that are designed to prepare a new struct instance to be used.

//You can also create your own as long as you follow one golden rule: all properties must have a value by the time the initializer ends.


struct Player {
    let name: String
    let number: Int

    //This init is the equalivent to the default one Swift Creates
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

/* Things to note
 
 
 There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
 Even though this creates a new Player instance, initializers never explicitly have a return type – they always return the type of data they belong to.
 I’ve used self to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.
 
 
 That last point is particularly important, because without self we’d have name = name and that doesn’t make sense – are we assigning the property to the parameter, assigning the parameter to itself, or something else? By writing self.name we’re clarifying we mean “the name property that belongs to my current instance,” as opposed to anything else.
 
 */



//our custom initializers don’t need to work like the default memberwise initializer Swift provides us with. For example, we could say that you must provide a player name, but the shirt number is randomized:
struct PlayerNoNum {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = PlayerNoNum(name: "Megan R")
print(player.number)

//Just remember the golden rule: all properties must have a value by the time the initializer ends. If we had not provided a value for number inside the initializer, Swift would refuse to build our code.
