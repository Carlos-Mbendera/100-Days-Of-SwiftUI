import Cocoa

// We can use if statements to check whether something is true or not
var number = 8

if number > 10{
    print("\(number) is bigger than 10")
}

//This example checks whether or not number is larger than 10 and prints a message when it is true
// The Braces (Curly Brackets) mark what should happen when a condition is met

//You can also use >= or < or <= for Greater than or Equal, Less than, Less than or equal
var grade = 80
if grade >= 80 {
    print("Nice work mate")
}

var badGrade = 12

if badGrade <= 20{
    print("Better luck next time")
}

if badGrade < 20{
    print("Better luck next time mate :(")
}

//We can use the same operators to compare alphabetical order of Strings

var ourName = "Carlos"
var friendName = "Sasha"

if ourName > friendName{
    print("\(ourName) VS \(friendName)")
}

if friendName > ourName {
    print("\(friendName) VS \(ourName)")
}

//To check if something IS EQUAL TO then we use ==
var country = "China"

if country == "China"{
    print("你好")
}

//We can also use IS NOT EQUAL TO

var username = "Mikey69"

if username != "Guest"{
    print("Hello \(username)")
}

// We can also check if there is no username. And we have a variety of choices

if username.isEmpty {
    username = "Guest"
}

if username.isEmpty == true{
    username = "Guest"
}

if username.count == 0 {
    username = "Guest"
}

if username == "" {
    username = "Guest"
}
