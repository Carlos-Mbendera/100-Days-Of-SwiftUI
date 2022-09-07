import Cocoa

/*
 This is a theory topic to be honest.
 
 You don’t need to understand in detail how opaque return types work, only that they exist and do a very specific job.
 
 Let’s implement two simple functions:
 */



func getRandomNumber() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool() -> Bool {
    Bool.random()
}


/*
 Tip: Bool.random() returns either true or false. Unlike random integers and decimals, we don’t need to specify any parameters because there are no customization options.

 So, getRandomNumber() returns a random integer, and getRandomBool() returns a random Boolean.

 Both Int and Bool conform to a common Swift protocol called Equatable, which means “can be compared for equality.” The Equatable protocol is what allows us to use ==, like this:
 */

print(getRandomNumber() == getRandomNumber())

/*Because both of these types conform to Equatable, we could try amending our function to return an Equatable value, like this:

func getRandomNumber() -> Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> Equatable {
    Bool.random()
}
 
 
 However, that code won’t work, and Swift will throw up an error message that is unlikely to be helpful at this point in your Swift career: “protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements”. What Swift’s error means is that returning Equatable doesn’t make sense, and understanding why it doesn’t make sense is the key to understanding opaque return types.
 
 
 First up: yes, you can return protocols from functions, and often it’s a really helpful thing to do. For example, you might have a function that finds car rentals for users: it accepts the number of passengers that it needs to carry, along with how much luggage they want, but it might send back one of several structs: Compact, ‌SUV, Minivan, and so on.

 We can handle this by returning a Vehicle protocol that is adopted by all those structs, and so whoever calls the function will get back some kind of car matching their request without us having to write 10 different functions to handle all car varieties. Each of those car types will implement all the methods and properties of Vehicle, which means they are interchangeable – from a coding perspective we don’t care which of the options we get back.

 Now think about sending back an Int or a Bool. Yes, both conform to Equatable, but they aren’t interchangeable – we can’t use == to compare an Int and a Bool, because Swift won’t let us regardless of what protocols they conform to.

 Returning a protocol from a function is useful because it lets us hide information: rather than stating the exact type that is being returned, we get to focus on the functionality that is returned. In the case of a Vehicle protocol, that might mean reporting back the number of seats, the approximate fuel usage, and a price. This means we can change our code later without breaking things: we could return a RaceCar, or a PickUpTruck, etc, as long as they implement the properties and methods required by Vehicle.

 Hiding information in this way is really useful, but it just isn’t possible with Equatable because it isn’t possible to compare two different Equatable things. Even if we call getRandomNumber() twice to get two integers, we can’t compare them because we’ve hidden their exact data type – we’ve hidden the fact that they are two integers that actually could be compared.

 This is where opaque return types come in: they let us hide information in our code, but not from the Swift compiler. This means we reserve the right to make our code flexible internally so that we can return different things in the future, but Swift always understands the actual data type being returned and will check it appropriately.

 To upgrade our two functions to opaque return types, add the keyword some before their return type, like this:
*/

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

/*
 And now we can call getRandomNumber() twice and compare the results using ==. From our perspective we still only have some Equatable data, but Swift knows that behind the scenes they are actually two integers.

 Returning an opaque return type means we still get to focus on the functionality we want to return rather than the specific type, which in turn allows us to change our mind in the future without breaking the rest of our code. For example, getRandomNumber() could switch to using Double.random(in:) and the code would still work great.

 But the advantage here is that Swift always knows the real underlying data type. It’s a subtle distinction, but returning Vehicle means "any sort of Vehicle type but we don't know what", whereas returning some Vehicle means "a specific sort of Vehicle type but we don't want to say which one.”

 At this point I expect your head is spinning, so let me give you a real example of why this matters in SwiftUI. SwiftUI needs to know exactly what kind of layout you want to show on the screen, and so we write code to describe it.

 In English, we might say something like this: “there’s a screen with a toolbar at the top, a tab bar at the bottom, and in the middle is a scrolling grid of color icons, each of which has a label below saying what the icon means written in a bold font, and when you tap an icon a message appears.”

 When SwiftUI asks for our layout, that description – the whole thing – becomes the return type for the layout. We need to be explicit about every single thing we want to show on the screen, including positions, colors, font sizes, and more. Can you imagine typing that as your return type? It would be a mile long! And every time you changed the code to generate your layout, you’d need to change the return type to match.

 This is where opaque return types come to the rescue: we can return the type some View, which means that some kind of view screen will be returned but we don’t want to have to write out its mile-long type. At the same time, Swift knows the real underlying type because that’s how opaque return types work: Swift always knows the exact type of data being sent back, and SwiftUI will use that create its layouts.

 Like I said at the beginning, opaque return types are a really obscure, really complex, but really important feature, and I wouldn’t cover them in a beginners course if it weren’t for the fact that they are used extensively in SwiftUI.

 So, when you see some View in your SwiftUI code, it’s effectively us telling Swift “this is going to send back some kind of view to lay out, but I don’t want to write out the exact thing – you figure it out for yourself.”
 */
