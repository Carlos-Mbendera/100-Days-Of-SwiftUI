import Cocoa

//To prevent our projects from crashing. Swift often forces us to handle errors properly. This involves 3 Steps
/*
 1. Telling Swift about the possible errors that can happen.
 2. Writing a function that can flag up errors if they happen.
 3. Calling that function, and handling any errors that might happen.
 */

enum PasswordError: Error{
    case obvious, short
}

func chcekPassword (_ password: String) throws -> String{
    //throws is a key word that lets Swfit know that it is possible for the function to have an error
    if password.count < 5 {
           throw PasswordError.short
       }

       if password == "12345" {
           throw PasswordError.obvious
       }
//if error condition is met, the function just stops errors are dealt with. Otherwise, it runs normal, onto the next section
        // This error would be handled in a do try and catch like so below
    
    
       if password.count < 8 {
           return "OK"
       } else if password.count < 10 {
           return "Good"
       } else {
           return "Excellent"
       }
    
}


do{
    var password = "12345"
    let result = try chcekPassword(password)
    //THE TRY indicates that the function may fail and that the functionality may halt here
    
    //You can also ignore this try and catch by using "try!" but you're risking a crash
}
catch{
    print("There was an error")
}
//You can have specific Catch blocks for particular errors too. If you don't specify the Error. Then it will just be the default catch
let string = "12345"

do {
    let result = try chcekPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error: \(error.localizedDescription)")
    //error.localizedDescription  is for apple's framework functions when they throw errors
}
