import Cocoa

//In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

class User {
    var username = "Anonymous"
}

var user1 = User()

var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

/*
 That’s going to print “Taylor” for both – even though we only changed one of the instances, the other also changed

 
 This might seem like a bug, but it’s actually a feature – and a really important feature too, because it’s what allows us to share common data across all parts of our app. As you’ll see, SwiftUI relies very heavily on classes for its data, specifically because they can be shared so easily.

 In comparison, structs do not share their data amongst copies, meaning that if we change class User to struct User in our code we get a different result: it will print “Anonymous” then “Taylor”, because changing the copy didn’t also adjust the original.
 
 */


//If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.

class UserCopyable {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}
//Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.
