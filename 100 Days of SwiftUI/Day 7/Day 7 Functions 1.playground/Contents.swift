import Cocoa

//FUNCTIONS


// Functions are just chunks of code you’ve split off from the rest of your program, and given a name so you can refer to them easily.
// They're like re usable pieces of code or frameworks

//For example
func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

//Whenever we call this func, we can print all these lines. No need to copy and paste
showWelcome()

/* BREAK DOWN

 It starts with the func keyword, which marks the start of a function.
 We’re naming the function showWelcome. This can be any name you want, but try to make it memorable – printInstructions(), displayHelp(), etc are all good choices.
 The body of the function is contained within the open and close braces, just like the body of loops and the body of conditions.
 
 There’s one extra thing in there, and you might recognize it from our work so far: the () directly after showWelcome. We first met these way back when we looked at strings, when I said that count doesn’t have () after it, but uppercased() does.

 Well, now you’re learning why: those () are used with functions. They are used when you create the function, as you can see above, but also when you call the function
 
 showWelcome()
 
 That’s known as the function’s call site, which is a fancy name meaning “a place where a function is called.”
 
 */

//The parentheses in reality let us add configuration to our functions. For example:

let exNumber = 12

print(exNumber.isMultiple(of: 2))

//If you look at print() and .isMultiple(of: ) We can configure how the function works by entering something in the parentheses

//Let's create a function with that also allows a configuartion

func generateTimesTable(number: Int){
    print("The \(number) times table is as follows:")
    for i in 1...12{
        print("\(i) x \(number) is \(i*number)")
    }
}

generateTimesTable(number: 69)

//The "number: Int" inside the parentheses is called a parameter, and it’s our customization point

//You can also have multiple parameters so naming them is important

func printTimesTablesWithExtraParameter(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTablesWithExtraParameter(number: 5, end: 20)

/*There the 5 and 20 are arguments: they are the actual values that get sent into the function to work with, used to fill number and end.

So, we have both parameters and arguments: one is a placeholder the other is an actual value, so if you ever forget which is which just remember Parameter/Placeholder, Argument/Actual Value.
 */
