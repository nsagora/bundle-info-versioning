import Foundation

class FakeUserDefaults<T>: UserDefaults {
    
    var value: T?
    var composedKey: String?
    
    override func set(_ value: Any?, forKey defaultName: String) {
        self.value = value as? T
        self.composedKey = defaultName
    }
    
    override func value(forKey key: String) -> Any? {
        self.composedKey = key
        return value
    }
}
