import Foundation

protocol MascotType {}

struct Mascot: MascotType {
    init() { print("Init real mascot") }
}

struct MockMascot: MascotType {
    init() { print("Init mock mascot") }
}

struct MascotProvider {
    private static let queue = DispatchQueue(label: String(describing: MascotProvider.self))
    private static var _mascot: MascotType?
    static var mascot: MascotType {
        get {
            if _mascot != nil { return _mascot! }
            queue.sync {
                if _mascot != nil { return }
                _mascot = Mascot()
            }
            return _mascot!
        }
        set { queue.sync { _mascot = newValue } }
    }
}

protocol HasMascot {}
extension HasMascot {
    var mascot: MascotType { return MascotProvider.mascot }
}

// Demonstrates single instantiation of `Mascot`
DispatchQueue.concurrentPerform(iterations: 10) { _ in
    _ = MascotProvider.mascot
}
