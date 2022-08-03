import Cocoa

//Type annotation is when you explictly state what type a variable should be

var noAnnotation = "This is not explict, Swift is guessing that it is a String"

var annotation: String = "By putting a Colon and typing the Data type, we have told Swift how to treat this variable"

//These are really useful if we don't want to assign some inital values

var exampleArray: [Int] = []
var anotherExampleArray = [Double]()
var albums: [String] = [String]()

var user: [String: String] = ["Username": "Radical"]

var books: Set<String> = Set([])

// Enums are a little different from the others because they let us create new types of our own, such as an enum containing days of the week, an enum containing which UI theme the user wants, or even an enum containing which screen is currently showing in our app.

enum UIStyle{
    case light, dark, system
}

var style: UIStyle = .dark

var otherStyleEx = UIStyle.light
otherStyleEx = .system

//With constants, you don't need to assign the value when you create it but you can use type annotations

let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)

