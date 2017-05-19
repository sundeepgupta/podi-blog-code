protocol MascotType {
    func dance()
}

struct Mascot: MascotType {
    func dance() { print("Do the Macarena") }
}

struct MockMascot: MascotType {
    func dance() { print("Do nothing") }
}

struct Team {
    let mascot: MascotType
}

let mascot = Mascot()
let team = Team(mascot: mascot)
team.mascot.dance() // Do the Macarena

let mockMascot = MockMascot()
let testTeam = Team(mascot: mockMascot)
testTeam.mascot.dance() // Do nothing
