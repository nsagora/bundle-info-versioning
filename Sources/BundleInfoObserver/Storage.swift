import Foundation

public protocol Storage {
    
    func set<T>(value: T?, for key: String)
    func getValue<T>(for key: String) -> T?
}
