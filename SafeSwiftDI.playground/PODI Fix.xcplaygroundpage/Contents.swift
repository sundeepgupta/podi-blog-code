protocol MascotType {
    func dance()
}

struct Mascot: MascotType {
    init() { print("Init real mascot") }
    func dance() { print("Do the Macarena") }
}

struct MockMascot: MascotType {
    init() { print("Init mock mascot") }
    func dance() { print("Do nothing") }
}


// Injection types
struct MascotProvider {
    static var mascot: MascotType = Mascot()
}

protocol HasMascot {}
extension HasMascot {
    var mascot: MascotType { return MascotProvider.mascot }
}


struct Team: HasMascot {}


MascotProvider.mascot = MockMascot()
let testTeam = Team()


