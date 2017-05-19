import Foundation

protocol MascotType {}

struct Mascot: MascotType {
    init() { print("Init real mascot") }
}

struct MockMascot: MascotType {
    init() { print("Init mock mascot") }
}

struct MascotProvider {
    private static var _mascot: MascotType?
    static var mascot: MascotType {
        get {
            if _mascot == nil { _mascot = Mascot() }
            return _mascot!
        }
        set { _mascot = newValue }
    }
}

protocol HasMascot {}
extension HasMascot {
    var mascot: MascotType { return MascotProvider.mascot }
}

// Uncomment to demonstrate multiple instantiations of `Mascot`.
//DispatchQueue.concurrentPerform(iterations: 10) { _ in
//    _ = MascotProvider.mascot
//}

MascotProvider.mascot = MockMascot()

// Output:
// Init mock mascot

