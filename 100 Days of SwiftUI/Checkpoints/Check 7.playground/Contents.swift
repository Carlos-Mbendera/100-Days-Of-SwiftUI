import Cocoa

class Animal{
    var legs: Int = 4
    
    init( legs: Int)
    {self.legs = legs}
}

class Dog: Animal{
    
    func speak() {
        print("Woof Woof Woof Ello There")
    }
    
}

class Cat: Animal{
    
    func speak() {
        print("Meow Meow Nya Nya Neko")
    }
    
    var isTame : Bool
    
    init(isTame: Bool, legs: Int ){
        self.isTame = isTame
        super.init(legs : legs)
     
    }
    
}
