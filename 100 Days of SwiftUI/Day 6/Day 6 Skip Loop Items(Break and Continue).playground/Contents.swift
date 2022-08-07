import Cocoa

//Swift gives us two ways to skip one or more items in a loop: continue skips the current loop iteration, and break skips all remaining iteratio


// In this example of continue. We will only get filenames that are jpg and nothing else
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture: \(filename)")
}


//An example of using Break


let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

/*
 That does quite a lot:

 Create two constants to hold two numbers.
 Create an integer array variable that will store common multiples of our two numbers.
 Count from 1 through 100,000, assigning each loop variable to i.
 If i is a multiple of both the first and second numbers, append it to the integer array.
 Once we hit 10 multiples, call break to exit the loop.
 Print out the resulting array.
 So, use continue when you want to skip the rest of the current loop iteration, and use break when you want to skip all remaining loop iterations.
 */
