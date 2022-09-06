import Cocoa

/* An alternative to using structs to create custom data types are classes.

 Similarites between classes and structs are:
 
 You get to create and name them.
 You can add properties and methods, including property observers and access control.
 You can create custom initializers to configure new instances however you want.
 
 Differences:
 
--  You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
 
 -- Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
 
-- When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
 
-- When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
 
 -- Even if you make a class constant, you can still change its properties as long as they are variables.
 
 
 WHY USE CLASSES?
 
 On the surface those probably seem fairly random, and there’s a good chance you’re probably wondering why classes are even needed when we already have structs.

 However, SwiftUI uses classes extensively, mainly for point 3: all copies of a class share the same data. This means many parts of your app can share the same information, so that if the user changed their name in one screen all the other screens would automatically update to reflect that change.
 
 The other points matter, but are of varying use:

 Being able to build one class based on another is really important in Apple’s older UI framework, UIKit, but is much less common in SwiftUI apps. In UIKit it was common to have long class hierarchies, where class A was built on class B, which was built on class C, which was built on class D, etc.
 Lacking a memberwise initializer is annoying, but hopefully you can see why it would be tricky to implement given that one class can be based upon another – if class C added an extra property it would break all the initializers for C, B, and A.
 Being able to change a constant class’s variables links in to the multiple copy behavior of classes: a constant class means we can’t change what pot our copy points to, but if the properties are variable we can still change the data inside the pot. This is different from structs, where each copy of a struct is unique and holds its own data.
 Because one instance of a class can be referenced in several places, it becomes important to know when the final copy has been destroyed. That’s where the deinitializer comes in: it allows us to clean up any special resources we allocated when that last copy goes away.
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

//The only difference between that and a struct is that it was created using class rather than struct – everything else is identical
