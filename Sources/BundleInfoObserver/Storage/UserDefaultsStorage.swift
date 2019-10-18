import Foundation

internal class UserDefaultsStorage: Storage {
    
    internal static var prefix = "com.nsagora.storage."
    
    private var userDefautlts = UserDefaults.standard
    
    internal init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefautlts = userDefaults
    }
    
    internal func set<T>(value: T?, for key: String) {
        let key = Self.prefix + key.replacingOccurrences(of: "/", with: "-");
        userDefautlts.set(value, forKey: key)
    }
    
    internal func getValue<T>(for key: String) -> T? {
        let key = Self.prefix + key.replacingOccurrences(of: "/", with: "-");
        return userDefautlts.value(forKey: key)
    }
}
