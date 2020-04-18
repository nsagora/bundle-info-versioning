import Foundation

/**
 The `Storage` protocol is used to define the structre for custom key-value storage implementations.
 */
public protocol Storage {
    
    /**
     Stores a generic `T` value for a given key.
     
     - parameter value: generic `T` value to store.
     - parameter key: the key associated with the value.
     */
    func set<T>(value: T?, for key: String)

    /**
     Retrieves  generic `T` value for a given key.
     
     - parameter key: the key associated with the value.
     - returns: generic `T` value.
     */
    func getValue<T>(for key: String) -> T?
}
