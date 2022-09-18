import Cocoa

protocol building{
    var rooms : Int {get}
    var cost: Int {get set}
    var agent: String {get}
}

extension building{
    func printSummary(){
        print("This building has \(rooms) rooms and costs \(cost). The person responsible is \(agent)")
    }
}

struct House: building{
    var rooms: Int = 3
    var cost: Int = 500_000
    var agent: String = "Mugen Rao"
}

struct Office : building{
    var rooms: Int = 6
    var cost: Int = 300_000_0000
    var agent: String = "Mugen Rao"
}

let ApplePark = Office()
ApplePark.printSummary()
