import Cocoa

//This is the code we ended with last time. Let's shorten it up.

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

print(captainFirstTeam)



//trailing closure syntax. This is us removing the paranthesis and only using curly brackets

let captainFirstTeamTrailClos = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}


//WE also don't need parameter names. Swift creates a set for us. $0, $1, $2 ...

let captainFirstTeamNoName = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}


//if this was a one line function, like a REVERSE SORT then we could be able to do this

let reverseTeam = team.sorted {
    return $0 > $1
}

let reverseTeamShort = team.sorted { $0 > $1 }
