protocol MascotType {}

struct Mascot: MascotType {
    init() { print("Init real mascot") }
}

struct MockMascot: MascotType {
    init() { print("Init mock mascot") }
}

struct MascotProvider {
    static var mascot: MascotType = Mascot()
}

protocol HasMascot {}
extension HasMascot {
    var mascot: MascotType { return MascotProvider.mascot }
}

MascotProvider.mascot = MockMascot()

// Output:
// Init real mascot
// Init mock mascot
