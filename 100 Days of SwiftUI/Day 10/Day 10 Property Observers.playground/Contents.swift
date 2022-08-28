import Cocoa

//Swift lets us create property observers, which are special pieces of code that run when properties change. These take two forms: a didSet observer to run when the property just changed, and a willSet observer to run before the property changed.

//Here is an example of didSet being used to print the new score after a goal is scored.

struct Game{
    //Note how we have the {} after the variable
    var score: Int = 0 {
        willSet{
            print("What a Goal!!!!")
    }
        didSet{
      print("We're now at \(score)")
        }
        //If you want it, Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from
    }
    
    
}


var game = Game()
game.score += 10
game.score -= 3
game.score += 1

//Here is a block of code that illustrates willSet and didSet in a more illustrative way

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")
