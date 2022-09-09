import Cocoa


//Optional chaining is a simplified syntax for reading optionals inside optionals. That might sound like something you’d want to use rarely, but if I show you an example you’ll see why it’s helpful.

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

/*This uses two optional features at once: you’ve already seen how the nil coalescing operator helps provide a default value if an optional is empty, but before that you see optional chaining where we have a question mark followed by more code.

Optional chaining allows us to say “if the optional has a value inside, unwrap it then…”

In our case we’re saying “if we managed to get a random element from the array, then uppercase it.” Remember, randomElement() returns an optional because the array might be empty.
 
 The magic of optional chaining is that it silently does nothing if the optional was empty – it will just send back the same optional you had before, still empty. This means the return value of an optional chain is always an optional, which is why we still need nil coalescing to provide a default value.

 Optional chains can go as long as you want, and as soon as any part sends back nil the rest of the line of code is ignored and sends back nil.
 
 To give you an example that pushes optional chaining harder, imagine this: we want to place books in alphabetical order based on their author names. If we break this right down, then:

 --We have an optional instance of a Book struct – we might have a book to sort, or we might not.
 --The book might have an author, or might be anonymous.
 --If it does have an author string present, it might be an empty string or have text, so we can’t always rely on the first letter being there.
 --If the first letter is there, make sure it’s uppercase so that authors with lowercase names such as bell hooks are sorted correctly.

 Here’s how that would look:

*/
struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

/*
 So, it reads “if we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise send back A”.

 Admittedly it’s unlikely you’ll ever dig that far through optionals, but I hope you can see how delightfully short the syntax is!
 */
