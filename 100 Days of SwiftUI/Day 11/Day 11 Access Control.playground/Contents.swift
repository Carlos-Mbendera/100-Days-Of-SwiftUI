import Cocoa

struct BankAccount {
    var fundsNoAC = 0
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//But the funds property is just exposed to us externally, so what’s stopping us from touching it directly? The answer is nothing at all – this kind of code is allowed:

account.fundsNoAC -= 1000

/*
To prevent this we need to implement access control on var funds

This is done by using private var funds

 Moreover, there are other keywords that can be used for access control
 
 Use private for “don’t let anything outside the struct use this.”
 Use fileprivate for “don’t let anything outside the current file use this.”
 Use public for “let anyone, anywhere use this.”
 Use private(set) for “let anyone read this property, but only let my methods write it.

 Important: If you use private access control for one or more properties, chances are you’ll need to create your own initializer.
 */
