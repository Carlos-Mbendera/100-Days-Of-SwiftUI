import Cocoa

//If we wanted to set a default value for a parameter we just put = after like decalring a varible or constant
//If there is an argument, then it overwrites the defualt

func printTimesTables(for number: Int, end : Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 3)
//This will print all the way to default 12

printTimesTables(for: 3, end: 69)
//This will preint till 69 * 3

//
var mainChars = ["Mugen","Jin","Fu"]
mainChars.removeAll()
//Quick note on how Swift handles Memory Allocation for Arrays. It does not reserve a large amount for an array at any moment. It just gives enough and a little extra just in case.
//Thus, when we .removeAll() the memory allocated decreases. However, we can prevent that, by changeing a default value in the function
mainChars.removeAll(keepingCapacity: true)
//Similar to our Times Table Function, you see


