import Cocoa

enum Weather{
    case rain, sunny, snow, wind, unknown
}

var forecast = Weather.rain

//Checking

if forecast == .sunny {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}


//Now we can check all these using IF and ELSE IF but that's alot of code, is not clean and can have issues like not checking snow above. A better solution is Switch Case

switch forecast{
    
case .rain:
    print("Carry water proof items")
    
case .sunny:
    print("Nice day for a picnic")
    
case .snow:
    print("Wear something warm mate")

case .wind:
    print("Do not walk with papers in hand")
    
case .unknown:
    print("Something strange happened")
}

//That default: at the end is the default case, which will be run if all cases have failed to match.

let place = "Metropolis"

switch place {
    
case "Gotham":
    print("You're Batman!")
    
case "Mega-City One":
    print("You're Judge Dredd!")
    
case "Wakanda":
    print("You're Black Panther!")
    
default:
    print("Who are you?")
}

//Remember: Swift checks its cases in order and runs the first one that matches. If you place default before any other case, that case is useless because it will never be matched and Swift will refuse to build your code.



// if you explicitly want Swift to carry on executing the following cases after one is met, use fallthrough. This is not commonly used, but sometimes – just sometimes – it can help you avoid repeating work.




let day = 5
print("My true love gave to me…")

switch day {
    
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


//Without Fall Through it stops at 5

let dayNoFallthrough = 5
print("My true love gave to me…")

switch dayNoFallthrough {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}
