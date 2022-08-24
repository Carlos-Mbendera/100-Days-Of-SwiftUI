import Cocoa

//You can create variables that are functions
//Pass functions into other functions as parameters
//Return functions from functions

func greetUser() {
    print("Hi there!")
}
//This line here with the paranthesis executes a function
greetUser()

//Without the paranthesis, we just copy the function and assign it to a var
var greetCopy = greetUser
greetCopy()

//We could also create a function directly into a var
var sayHello = {
    print("Hi there!")
}

sayHello()

//This type of code is called Closure Expression

//If we want our closure to accept parameters. We got to write them in a special way

let sayHelloPara = { (name: String) in
    print("Hi \(name)!")
}

//Take speical note of IN and how the parameters are defined after the curly brackers{}

//We could also have our closure return values

let sayHelloRet = { (name: String) -> String in
    "Hi \(name)"
}

let greeting = sayHelloRet("Carl")
print(greeting)

//MARK:- NOW if you think about it. All variables and constants have a type. So when we copied greetUser. What type was that?

var greetCopyDetailed: () -> Void = greetUser

// Let's break this down
/*
1. The empty parentheses marks a function that takes no parameters.
2. The arrow means just what it means when creating a function: we’re about to declare the return type for the function.
3. Void means “nothing” – this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused with the empty parameter list.
 */

//So by this logic sayHelloRet is (String) -> String

var proof: (String) -> String = sayHelloRet
print(proof("Mate"))
//Also note that we did not import the names of the parameter. In sayHelloRet we did not carry over "name" to proof

//external parameter names only matter when we’re calling a function directly, not when we create a closure or when we take a copy of the function first.

//But wait THERE'S MORE

//Some functions can accept functions and closures as parameters to modify there functionality. For example, .sorted()

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)
//We're going to write an algorithm that sorts the array but makes sure Suzanne is first. And then we pass it to .sorted

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let sortedTeamVerOne = team.sorted(by: captainFirstSorted)
print(sortedTeamVerOne)

//NOW if you recall, Closures are basically functions without a name. Thus, we can put a closure directly rather than creating a function


let sortedTeamVerTWO = team.sorted(by: {(name1:String, name2:String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(sortedTeamVerTWO)

//Although their functionality is exactly the same. You may get confused with all this syntax. All the ({})

//SO NEXT PLAYGROUND we focus on making it shorter.
