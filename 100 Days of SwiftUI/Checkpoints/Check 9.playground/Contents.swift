import Cocoa

func selectRandomly(in array: [Int]?) -> Int{
    array?.randomElement() ?? Int.random(in: 1...100)
    }

let xArray: [Int]? = [12,31,312]
selectRandomly(in: xArray)

let yArray: [Int]? = nil
selectRandomly(in: yArray)
