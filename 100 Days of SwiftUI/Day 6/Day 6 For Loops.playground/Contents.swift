import Cocoa

//Loops allow us to run code over and over again in a short and concise way

let countriesAfrica = ["Malawi","South Africa","Botswana", "Nambia","Zambia"]
//This code will work for arrays,sets, dictionaries and co
for place in countriesAfrica{
    print("\(place) is in Southern Africa")
}

//place is a variable that can only be used and refrenced inside the loop
//The code inside the braces(curly brackets) is called Loop Body
//A single cycle of a loop is an iteration
//Place is a loop variable and will change in the next iteration

//We can also make a loop using a range of numbers

for i in 1...12 {
    print("\(i) x 69 is \(i * 69)")
}

//The 1...12 part is a range, and means “all integer numbers between 1 and 12, as well as 1 and 12 themselves.” Ranges are their own unique data type in Swift.


//You can also make nested Loops, in other words, a loop inside a loop

for i in 1...12{
    print("The \(i) Times Table")
    
    for j in 1...12{
        print("\(i) x \(j) is \(i*j)")
    }
}

// if you want to make a range that excludes the final number, just do this:

for i in 1..<5{
    print("This will count up to 4 times")
}

//Since we didn't use a varaible in the last bit of code, we can create a loop without one by using an underscore

for _ in 1..<10{
    print("This will appear 9 times")
}
