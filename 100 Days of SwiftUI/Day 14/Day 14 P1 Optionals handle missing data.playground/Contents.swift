import Cocoa

//Optionals might have a value or not

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]
//There we create a [String: String] dictionary with two keys: Mario and Luigi. We then attempt to read the value attached to the key “Peach”, which doesn’t exist, and we haven’t provided a default value to send back in place of missing data.

//Swift’s solution is called optionals, which means data that might be present or might not. They are primarily represented by placing a question mark after your data type, so in this case peachOpposite would be a String? rather than a String.

//Optionals are like a box that may or may not have something inside. So, a String? means there might be a string waiting inside for us, or there might be nothing at all – a special value called nil, that means “no value”. Any kind of data can be optional, including Int, Double, and Bool, as well as instances of enums, structs, and classe

//Swift likes our code to be predictable, which means it won’t let us use data that might not be there. In the case of optionals, that means we need to unwrap the optional in order to use it

//Swift gives us two primary ways of unwrapping optionals, but the one you’ll see the most looks like this:

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

/* This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let) <<Also works with if var>>. Together, it does three things:

-- It reads the optional value from the dictionary.
 
-- If the optional has a string inside, it gets unwrapped – that means the string inside gets placed into the marioOpposite constant.
 
-- The condition has succeeded – we were able to unwrap the optional – so the condition’s body is run.
 
 The condition’s body will only be run if the optional had a value inside. Of course, if you want to add an else block you can – it’s just a normal condition, so this kind of code is fine:
 */

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

/* Optionals a bit like Schrödinger’s data type: there might be a value inside the box or there might not be, but the only way to find out is to check.
 
 In the same way optionals mean data may or may not be present, non-optionals – regular strings, integers, etc – mean data must be available.

 Think about it: if we have a non-optional Int it means there is definitely a number inside, always. It might be something like 1 million or 0, but it’s still a number and is guaranteed to be present. In comparison, an optional Int set to nil has no value at all – it’s not 0 or any other number, it’s nothing at all.

 Every data type can be optional if needed, including collections such as Array and Dictionary. Again, an array of integers might contain one or more numbers, or perhaps no numbers at all, but both of those are different from optional arrays set to nil.

 To be clear, an optional integer set to nil is not the same as a non-optional integer holding 0, an optional string set to nil is not the same as a non-optional string that is currently set to an empty string, and an optional array set to nil is not the same as a non-optional array that currently has no items – we’re talking about the absence of any data at all, empty or otherwise.

*/

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
// print(square(number: number))   Swift will refuse to build that code, because the optional integer needs to be unwrapped – we can’t use an optional value where a non-optional is needed, because if there were no value inside we’d hit a problem.


if let number = number {
    print(square(number: number))
}

// it’s very common to unwrap them into a constant of the same name. This is perfectly allowable in Swift, and means we don’t need to keep naming constants unwrappedNumber or similar.
