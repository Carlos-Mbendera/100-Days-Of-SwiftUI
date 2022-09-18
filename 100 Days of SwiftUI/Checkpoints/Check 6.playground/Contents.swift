import Cocoa

struct car {
    let model : String
    let NumOfSeats : Int
    var currentGear : Int = 0
    
    mutating func changeGear(up gearChangeUp: Bool){
        if gearChangeUp == true && currentGear != 6 {
          currentGear += 1
        }
        else if gearChangeUp == false && currentGear != 0 {
            currentGear -= 1
        }else{
            print("Can not change gear")
        }
        print("Gear is \(currentGear)")
    }
    
}

var Merc: car = car(model: "S Class", NumOfSeats: 2)
Merc.changeGear(up: false)
