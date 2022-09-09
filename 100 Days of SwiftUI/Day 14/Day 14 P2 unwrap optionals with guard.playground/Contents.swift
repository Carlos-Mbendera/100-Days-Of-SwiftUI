import Cocoa

//Like if let, guard let checks whether there is a value inside an optional, and if there is it will retrieve the value and place it into a constant of our choosing.

//However, the way it does so flips things around:

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}

/*
 So, if let runs the code inside its braces if the optional had a value, and guard let runs the code inside its braces if the optional didn’t have a value. This explains the use of else in the code: “check that we can unwrap the optional, but if we can’t then…”

 I realize that sounds like a small difference, but it has important ramifications. You see, what guard provides is the ability to check whether our program state is what we expect, and if it isn’t to bail out – to exit from the current function, for example.

 This is sometimes called an early return: we check that all a function’s inputs are valid right as the function starts, and if any aren’t valid we get to run some code then exit straight away. If all our checks pass, our function can run exactly as intended.

 guard is designed exactly for this style of programming, and in fact does two things to help:

 -- If you use guard to check a function’s inputs are valid, Swift will always require you to use return if the check fails.
 -- If the check passes and the optional you’re unwrapping has a value inside, you can use it after the guard code finishes.
 
 
 You can see both of these points in action if you look at the printSquare() function below:
 */
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")

        // 1: We *must* exit the function here
        return
    }

    // 2: `number` is still available outside of `guard`
    print("\(number) x \(number) is \(number * number)")
}

//So: use if let to unwrap optionals so you can process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise.

//Tip: You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use guard someArray.isEmpty else { return }.
