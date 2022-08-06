import Cocoa

//In the last Day 5 Playground called "If Statements"
//The code was something like this

var age = 16

if age < 18 {
    print("Sorry Mate, you can't vote.")
}

if age > 18 {
    print("You can vote")
}

// However this is impractical as these two cases are not exclusive to one another. They both involve age. So this is better:
if age > 18{
    print("You can vote")
}else{
    print("Sorry Mate, you can't vote.")
}

// That's not all, there is also Else If

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

//Now you may have notcied that you can put if statements inside other if statements. Nested if statements. Like so

let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

//For some code this is alright. However, since it's comparing temp in both stances. A better way would be:

if temp > 20 && temp < 30{
    print("It's a nive day.")
}

//The && is read as AND and is pretty similar to the logic gate equalivent

//There is another function similar to AND, it's OR, whereby only one of the 2 conditions needs to be met. It's || in Swift

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game")
}

// You can remove "== true"

//An example using all the above concepts, is now shown below

enum TransportOptions {
    case plane, helicopter, bike, car, scooter
}

let transport = TransportOptions.plane

if transport == .plane || transport == .helicopter{
    print("Let's fly to the mooooon")
    
} else if  transport == .bike {
   print("Please may there be a bike route")
    
}else if transport == .car{
    print("No trafic today please")
}
else{
    print("Scooters are pretty hip and cool these days. Esspecially in Spring(Haru)")
    //The Haru part is a refrence to an Anime I like, pretty good one called Sing Yesterday For Me
}

