import Cocoa
 
//So now we can process data, but we should work on returning the results

let root = sqrt(69)
//This function has processed and returned the data
print(root)

//When writing our own functions which can return data it is very important that we include RETURN and the ARROW

func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let roll = rollDice()
print("You Rolled a \(roll) UwU")
//Swift we always make sure return the type we specified in the function. Cause Type Safety

//Ho Ho Ho
//Let's look at example code now...

func LONGareLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first == second
}
//We can actually shoten this up

func SHORTERareLettersIdentical(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

//However, since it only has one line of code and Swift already knows what we want to return we can make it even Shorter

func SHORTESTareLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted()
}

//Based on that logic the first snippet can also be this short

func SHORTESTrollDice() -> Int {
    Int.random(in: 1...6)
}

//REMEMBER This only workds when there is one line of code

//Also you can force exit functions with return
//If your function doesn’t return a value, you can still use return by itself to force the function to exit early. For example, perhaps you have a check that the input matches what you expected, and if it doesn’t you want to exit the function immediately before continuing.
