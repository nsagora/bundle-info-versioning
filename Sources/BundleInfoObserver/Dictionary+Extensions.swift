import Foundation

extension Dictionary where Key == String {
    
    internal func value(for keyPath: Key) -> Value? {
        
        let keys = keyPath.split(separator: "/").map(String.init)
        return value(for: keys)
    }
    
    private func value(for keyPath: [Key]) -> Value? {
        
        guard let firstKey = keyPath.first else { return nil }
        guard let lastKey = keyPath.last else { return nil }
        
        if firstKey == lastKey {
            return self[firstKey]
        }
        
        guard let underlyingDict = self[firstKey] as? Dictionary<Key, Value> else { preconditionFailure("Expecting an underlying dictionary for key '\(firstKey)'") }
        
        let newKeyPath = keyPath.dropFirst().joined(separator: "/")
        return underlyingDict.value(for: newKeyPath)
    }
}
