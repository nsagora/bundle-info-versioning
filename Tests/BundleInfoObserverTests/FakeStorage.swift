import Foundation
@testable import BundleInfoObserver

class FakeStorage: Storage {
    
    private var oldValue: Any?
    
    func set<T>(value: T?, for key: String) {
        oldValue = value
    }
    
    func getValue<T>(for key: String) -> T? {
        return oldValue as? T
    }
}
