import Cocoa

//How do we write functions that can accept functions

//Easy, if you remeber how to decalre a varibale's type as a function

let example: () -> Void = {
    print("This is an example")
}

//So here is a function that accepts functions as parameters

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


//If you want a more complex example. Behold:

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
/*
 Let’s break that down…

 The function is called makeArray(). It takes two parameters, one of which is the number of integers we want, and also returns an array of integers.
 The second parameter is a function. This accepts no parameters itself, but will return one integer every time it’s called.
 Inside makeArray() we create a new empty array of integers, then loop as many times as requested.
 Each time the loop goes around we call the generator function that was passed in as a parameter. This will return one new integer, so we put that into the numbers array.
 Finally the finished array is returned.
 */

/* The complex part is the very first line:
 
 func makeArray(size: Int, using generator: () -> Int) -> [Int] {
 There we have two sets of parentheses and two sets of return types, so it can be a bit of a jumble at first. If you split it up you should be able to read it linearly:

 We’re creating a new function.
 The function is called makeArray().
 The first parameter is an integer called size.
 The second parameter is a function called generator, which itself accepts no parameters and returns an integer.
 The whole thing – makeArray() – returns an array of integers.
 The result is that we can now make arbitrary-sized integer arrays, passing in a function that should be used to generate each number:

 
*/
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)


func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)
