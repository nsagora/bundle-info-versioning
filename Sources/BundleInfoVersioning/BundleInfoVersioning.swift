import Foundation

/**
 `BundleInfoVersioning` checks at runtime if, for a given keypath, there have been changes in the `info.plist` file from the associated `Bundle`.
 
 Check for `CFBundleShortVersionString` updates and show a _What's new_ like screen each time the user updates the app:
 
 ``` swift
 import BundleInfoVersioning

 let bundleInfoVersioning = BundleInfoVersioning()

 bundleInfoVersioning.check(forKeyPath: "CFBundleShortVersionString") { (_ , newVersion: String?) in
     self.showWhatsNew(in: newVersion)
 }

 ```
*/
public class BundleInfoVersioning {

    internal let bundle: Bundle
    internal let storage: Storage
    
    /**
     Creates and returns a new `BundleInfoVersioning` instance for a given `Bundle` object.
     
     - Parameter bundle: A `Bundle` object associated with your app or target. If you don't provide a bundle, then the `Bundle.main` it will be used by default.
     
     Check for `CFBundleShortVersionString` updates and show a _What's new_ like screen each time the user updates the app:
     
     ``` swift
     import BundleInfoVersioning

     let bundleInfoVersioning = BundleInfoVersioning()

     bundleInfoVersioning.check(forKeyPath: "CFBundleShortVersionString") { (_ , newVersion: String?) in
         self.showWhatsNew(in: newVersion)
     }
    */
    public init(bundle: Bundle = .main) {
        self.bundle = bundle
        self.storage = UserDefaultsStorage()
    }
    
    /**
     Creates and returns a new `BundleInfoVersioning` instance for a given `Bundle` object and a custom `Storage` implementation.
     
     - Parameter bundle: A `Bundle` object associated with your app or target. If you don't provide a bunlde, `Bundle.main` it will be used.
     - Parameter storage: A `Storage` object with a custom implementation for storing the `info.plist` changes.
     
     The `BundeInfoVersioning` framework comes with a build-in storage system, implemented on top of `UserDefaults`.

     However, if this doesn't fit the apps needs, you can implement a custom key-value storage by conforming to the `Storage` protocol.
     
     ```swift
     import BundleInfoVersioning

     class MyStorage: Storage {
         func set<T>(value: T?, for key: String) {
             UserDefaults.standard.set(value, forKey: key)
         }
         
         func getValue<T>(for key: String) -> T? {
             return UserDefaults.standard.value(forKey: key) as? T
         }
     }

     let storage = MyStorage()
     let bundleInfoVersioning = BundleInfoVersioning(bundle: .main, storage: storage)

     bundleInfoVersioning.check(forKeyPath: "NSAgora/DatabaseVersion") { (old: Int?, new: Int?) in
         self.migrateDataBase()
     }
     ```
    */
    public init(bundle: Bundle = .main, storage: Storage) {
        self.bundle = bundle
        self.storage = storage
    }
    
    /**
     Checks for changes in your app or target `info.plist` file.
     
     - Parameter keyPath: A valid key path from your app or target `info.plist` file.
     - Parameter callback: The `callback` closure that is called with the `storedValues` and the `currentValue` for the given key path. The `callback` is called when the `storedValue` and `currentValue` are different.
     - Parameter storedValue: The stored value for a given key path. First time this will be `nil`.
     - Parameter currentValue: The current value from the `info.plist` file for the given key path.

     Check for `CFBundleVersion` updates and track in the analytics when the app is installed or updated:

     ``` swift
     import BundleInfoVersioning

     let bundleInfoVersioning = BundleInfoVersioning(bundle: .main)

     bundleInfoVersioning.check(forKeyPath: "CFBundleVersion") { (old: String?, new: String?) in
        if old == nil {
            Analytics.install(version: new)
        }
        else {
            Analytics.update(from: old, to: new)
        }
     }
     ```
     
     - Note:
     The `callback` will not be called if the provided `Bundle` object  doesn't have an associated `info.plist` file. Also, the  `callback` will not be called if the provied key path is not valid.
    */
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
