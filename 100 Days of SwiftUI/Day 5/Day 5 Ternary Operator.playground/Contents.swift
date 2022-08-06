import Cocoa

//Firstly, +,*,/ and the others we've worked with are Binary Operators as they only TWO Inputs

//If they had 3 inputs, we'd call it a Ternary Operator. However, there is only one of those in Swift. So we call it THE Ternary Operator

//It lets us check a condition and return one of two values: something if the condition is true, and something if it’s false.

let age = 18
let canVote = age >= 18 ? "Yes" : "False"

/*The ternary operator is split into three parts:
  a check (age >= 18),
 something for when the condition is true (“Yes”),
 and something for when the condition is false (“No”) */

//Examples:
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")



let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)


//It gets a little hard to read when your condition use == to check for equality, as you can see here:
enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
