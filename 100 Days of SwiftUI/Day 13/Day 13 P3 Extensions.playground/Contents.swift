import Cocoa
import Foundation

//Extensions let us add functionality to any type, whether we created it or someone else created it – even one of Apple’s own types.

//To demonstrate this, I want to introduce you to a useful method on strings, called trimmingCharacters(in:). This removes certain kinds of characters from the start or end of a string, such as alphanumeric letters, decimal digits, or, most commonly, whitespace and new lines.

var quote = "     Do whatever you want cause that's what I'll be doing    "
//If we wanted to trim the whitespace and newlines on either side, we could do so like this:
let quoteTrimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//Having to call trimmingCharacters(in:) every time is a bit wordy, so let’s write an extension to make it shorter:

extension String{
    func trim() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

/*
 Let’s break that down…

 --We start with the extension keyword, which tells Swift we want to add functionality to an existing type.
 --Which type? Well, that comes next: we want to add functionality to String.
 --Now we open a brace, and all the code until the final closing brace is there to be added to strings.
 --We’re adding a new method called trimmed(), which returns a new string.
 --Inside there we call the same method as before: trimmingCharacters(in:), sending back its result.
 --Notice how we can use self here – that automatically refers to the current string. This is possible because we’re currently in a string extension.

 
And now everywhere we want to remove whitespace and newlines we can just write the following:
 */

var quoteTrimmedEx = quote.trim()
print(quote)
print(quoteTrimmedEx)

//Well, the truth is that we could have written a function like this:

func trim(_ string: String) -> String{
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}


let trimmed2 = trim(quote)

/*
 That’s less code than using an extension, both in terms of making the function and using it. This kind of function is called a global function, because it’s available everywhere in our project.

 However, the extension has a number of benefits over the global function, including:

 --When you type quote. Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
 --Writing global functions makes your code rather messy – they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending.
 --Because your extension methods are a full part of the original type, they get full access to the type’s internal data. That means they can use properties and methods marked with private access control, for example.
 
 What’s more, extensions make it easier to modify values in place – i.e., to change a value directly, rather than return a new value.
 
 You can also use extensions to add properties to types, but there is one rule: they must only be computed properties, not stored properties. The reason for this is that adding new stored properties would affect the actual size of the data types – if we added a bunch of stored properties to an integer then every integer everywhere would need to take up more space in memory, which would cause all sorts of problems.
 */


struct Book{
    let title: String
    let pages: Int
    let readingHours: Int
}

extension Book{
    init(title: String, pages: Int) {
        self.title = title
        self.pages = pages
        self.readingHours = pages / 50
    }
}


// You’ve seen previously how Swift automatically generates a memberwise initializer for structs, like this:
let lotr = Book(title: "Lord of the Rings", pages: 1178, readingHours: 24)

//if we implemented a custom initializer inside our struct, then Swift would have disabled the automatic memberwise initializer.
//if we implement a custom initializer inside an extension, then Swift won’t disable the automatic memberwise initialize
let hobbit = Book (title: "The Hobbit", pages: 6969)
