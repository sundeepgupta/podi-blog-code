protocol MascotType {
    func dance()
}

struct Mascot: MascotType {
    func dance() { print("Do the Macarena") }
}

struct MockMascot: MascotType {
    func dance() { print("Do nothing") }
}

struct MascotProvider {
    static var mascot: MascotType = Mascot()
}

protocol HasMascot {}
extension HasMascot {
    var mascot: MascotType { return MascotProvider.mascot }
}

struct Team: HasMascot {}

let team = Team()
team.mascot.dance() // Do the Macarena

MascotProvider.mascot = MockMascot()
let testTeam = Team()
testTeam.mascot.dance() // Do nothing
