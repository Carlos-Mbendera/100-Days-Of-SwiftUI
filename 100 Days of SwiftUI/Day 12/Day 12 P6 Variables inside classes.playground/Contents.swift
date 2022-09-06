import Cocoa

/*
 Swift’s classes work a bit like signposts: every copy of a class instance we have is actually a signpost pointing to the same underlying piece of data. Mostly this matters because of the way changing one copy changes all the others, but it also matters because of how classes treat variable properties.

This one small code sample demonstrates how things work:
 */


class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)
/*
That creates a constant User instance, but then changes it – it changes the constant value. That’s bad, right?

Except it doesn’t change the constant value at all. Yes, the data inside the class has changed, but the class instance itself – the object we created – has not changed, and in fact can’t be changed because we made it constant
 
 If we had made the name property a constant using let, then it could not be changed
 
 In contrast, what happens if we made both the user instance and the name property variables? Now we’d be able to change the property, but we’d also be able to change to a wholly new User instance if we wanted.
*/

class User {
    var name = "Paul"
}

var user = User()
user.name = "Taylor"
user = User()
print(user.name)

/*
 That would end up printing “Paul”, because even though we changed name to “Taylor” we then overwrote the whole user object with a new one, resetting it back to “Paul”.
 
 The final variation is having a variable instance and constant properties, which would mean we can create a new User if we want, but once it’s done we can’t change its properties.

 So, we end up with four options:

 Constant instance, constant property – a signpost that always points to the same user, who always has the same name.
 Constant instance, variable property – a signpost that always points to the same user, but their name can change.
 Variable instance, constant property – a signpost that can point to different users, but their names never change.
 Variable instance, variable property – a signpost that can point to different users, and those users can also change their names.
 
 
 
 
 
 
 This might seem awfully confusing, and perhaps even pedantic. However, it serves an important purpose because of the way class instances get shared.

 Let’s say you’ve been given a User instance. Your instance is constant, but the property inside was declared as a variable. This tells you not only that you can change that property if you want to, but more importantly tells you there’s the possibility of the property being changed elsewhere – that class you have could be a copy from somewhere else, and because the property is variable it means some other part of code could change it by surprise.

 When you see constant properties it means you can be sure neither your current code nor any other part of your program can change it, but as soon as you’re dealing with variable properties – regardless of whether the class instance itself is constant or not – it opens up the possibility that the data could change under your feet.

 This is different from structs, because constant structs cannot have their properties changed even if the properties were made variable. Hopefully you can now see why this happens: structs don’t have the whole signpost thing going on, they hold their data directly. This means if you try to change a value inside the struct you’re also implicitly changing the struct itself, which isn’t possible because it’s constant.

 One upside to all this is that classes don’t need to use the mutating keyword with methods that change their data. This keyword is really important for structs because constant structs cannot have their properties changed no matter how they were created, so when Swift sees us calling a mutating method on a constant struct instance it knows that shouldn’t be allowed.

 With classes, how the instance itself was created no longer matters – the only thing that determines whether a property can be modified or not is whether the property itself was created as a constant. Swift can see that for itself just by looking at how you made the property, so there’s no more need to mark the method specially.

 */
