import Cocoa


enum SqrtErrors : Error{
    case outOfBounds, noRoot
}

func findSqrt(for number: Int) throws -> Int {
    
    if number < 1 || number > 9999{
        throw SqrtErrors.outOfBounds
        
    }else{
       
        for i in 1...number{
            if i * i == number{
                return i
                break
            }
            
        }
    }
    throw SqrtErrors.noRoot
}

let cc = 400
print("The Square root of \(cc) is \( findSqrt(for: cc))")
