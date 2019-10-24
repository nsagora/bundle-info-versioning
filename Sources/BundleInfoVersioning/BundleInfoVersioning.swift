import Foundation

/// `BundleInfoVersioning` checks at runtime if, for a given keypath, there have been changes in the `info.plist`file from the associated `Bundle`.
public class BundleInfoVersioning {

    internal let bundle: Bundle
    internal let storage: Storage
    
    /// Creates a new `BundleInfoVersioning` instance for a given `Bundle` object.
    ///  - Parameter bundle: A `Bundle` object associated with your app or target. If you don't provide a bunlde, `Bundle.main` it will be used.
    public init(bundle: Bundle = .main) {
        self.bundle = bundle
        self.storage = UserDefaultsStorage()
    }
    
    /// Creates a new `BundleInfoVersioning` instance for a given `Bundle` object and a custom `Storage` implementation.
    /// - Parameter bundle: A `Bundle` object associated with your app or target. If you don't provide a bunlde, `Bundle.main` it will be used.
    /// - Parameter storage: A `Storage` object with a custom implementation for storing the `info.plist` changes.
    public init(bundle: Bundle = .main, storage: Storage) {
        self.bundle = bundle
        self.storage = storage
    }
    
    /// Checks for changes in your app or target `info.plist` file.
    /// - Parameter keyPath: A valid key path from your app or target `info.plist` file.
    /// - Parameter callback: The `callback` closure that is called with the `storedValues` and the `currentValue` for the given key path. The `callback` is called only if the `storedValue` and `currentValue` are different.
    /// - Parameter storedValue: The previous stored value for a given key path. First time this will be `nil`.
    /// - Parameter currentValue: The current values available in the `info.plist` file for the given key path.
    ///
    /// The `callback` will not be called if the provided `Bundle` object  doesn't have an associated `info.plist` file. Also, the  `callback` will not be called if the provied key path is not valid.
    public func check<T: Comparable>(forKeyPath keyPath: String, callback: (_ storedValue: T?, _ currentValue: T?) -> Void) {

        let currentValue: T? = getBundleInfoValue(for: keyPath)
        let storedValue: T? = storage.getValue(for: keyPath)
        
        guard currentValue != storedValue else { return }
        
        callback(storedValue, currentValue)
        storage.set(value: currentValue, for: keyPath)
    }
    
    private func getBundleInfoValue<T>(for keyPath: String) -> T? {
       
        guard let infoDic = bundle.infoDictionary else { return nil }
        return infoDic.value(for: keyPath) as? T
    }
}
