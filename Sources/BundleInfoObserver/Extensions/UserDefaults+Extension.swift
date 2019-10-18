import Foundation

extension UserDefaults {
    
    internal func value<T>(forKey key: String) -> T? {
        return value(forKey: key) as? T
    }
}
