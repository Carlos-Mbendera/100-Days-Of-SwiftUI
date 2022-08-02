import Cocoa

var greeting = "Hello, playground"

//Booleans have one main operation
// This is !
//Which means is not. Basically, it inverses the value of the Boolean Variable

var isAuth = true
print(!isAuth)

// You can also do a similar thing with .toggle()
isAuth.toggle()
print(isAuth)
// This changes the variable's value though

//HOW TO JOIN STRINGS TOGETHER

// An easy way to joins Strings is with +
var first = "Mugen"
var second = "Rad"
var truth = first + " is " + second
print(truth)
// Truth is a combination of all the Strings. This is another example of Type Safety as only Strings can + other Strings

// Also since + can be used for different types and its functionality changes according to context. This is called Operator Overloading - the ability for one operator such as + to mean different things depending on how it’s used

//Ths tactic of joining Strings is a bti wasteful memory wise though. There is a better way *String Interpolation*
//We can use \ (like with quotes in strings) with other variables

var mate = "Mike"
var favDrink = 21

var message = "My good mate \(mate) loves Drink Number \(favDrink)"

//Code wise this is better than using + and it also lets us use various data types easier

//it's also more effecient than the next code
var badMessage = "My good mate " + mate + " loves Drink Number " + String(favDrink)

//You can also do data manupliation with String Interpolation
var example = "An exaple of multiplying is this \(3*3)"








