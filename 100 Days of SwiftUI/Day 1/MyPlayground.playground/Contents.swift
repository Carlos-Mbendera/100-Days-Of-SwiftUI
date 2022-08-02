import Cocoa

//STRINGS


var greeting = "Hello, playground"

var radName = "Mugen"
radName = "Jin"
print(radName)

let headache = "Fu"

print("Headache is Fu")

let fu: String = "Girl 👯‍♀️"

print(fu)

let shortParagraph: String = """
A Day
In the life of
A Rad Samurai
"""

print(shortParagraph)

// Count lets us know how many chars are in  a string
print (headache.count)

//Uppercase makes every char capital
print(headache.uppercased())

// Has Prefix ()  let's check if a String contains a certain set of chars. However, it is case sensive

print(shortParagraph.hasPrefix("A Day"))

//Has Suffix () is similar to hasPrefix() except it focuses on the ending
print(shortParagraph.hasSuffix("A Day"))
// This will return false


// INTEGERS




//When creating Integer, you can use underscores to break up numbers similar to a comma in real life
// For exacple

let bigNoSpacesNumber = 100000000000000
let bigNumber = 100_000_000_000_000
print(bigNumber)

// Just like magic UwU

//Integer Edits

var counter = 231
counter += 14
print(counter)
// Basically the same as counter = counter + 5
//Just put a different sign like *,/,- and it will do it to the variable

// You can also check if something is a multiple like so
let testNumber = 10
print(testNumber.isMultiple(of: 2))
//OR
print(10.isMultiple(of: 2))


//DECIMAL NUMBERS

let num = 0.1 + 0.2
print(Double(num))
