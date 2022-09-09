import Cocoa

//Swift has a third way of unwrapping optionals? Yep! And it’s really useful, too: it’s called the nil coalescing operator and it lets us unwrap an optional and provide a default value if the optional was empty.

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//That reads a non-existent key in our captains dictionary, which means new will be an optional string to set to nil. With the nil coalescing operator, written ??, we can provide a default value for any optional, like this:
let new = captains["Serenity"] ?? "N/A"

/*
 That will read the value from the captains dictionary and attempt to unwrap it. If the optional has a value inside it will be sent back and stored in new, but if it doesn’t then “N/A” will be used instead.

 This means no matter what the optional contains – a value or nil – the end result is that new will be a real string, not an optional one. That might be the string from inside the captains value, or it might be “N/A”.

 Now, I know what you’re thinking: can’t we just specify a default value when reading from the dictionary? If you’re thinking that you’re absolutely correct:
 */
let newExample = captains["Serenity", default: "N/A"]

//That produces exactly the same result, which might make it seem like the nil coalescing operator is pointless. However, not only does the nil coalescing operator work with dictionaries, but it works with any optionals.

//For example, the randomElement() method on arrays returns one random item from the array, but it returns an optional because you might be calling it on an empty array. So, we can use nil coalescing to provide a default:

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

//Or perhaps you have a struct with an optional property, and want to provide a sensible default for when it’s missing:

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

//It’s even useful if you create an integer from a string, where you actually get back an optional Int? because the conversion might have failed – you might have provided an invalid integer, such as “Hello”. Here we can use nil coalescing to provide a default value, like this:

let input = ""
let number = Int(input) ?? 0
print(number)

//As you can see, the nil coalescing operator is useful anywhere you have an optional and want to use the value inside or provide a default value if it’s missing.
