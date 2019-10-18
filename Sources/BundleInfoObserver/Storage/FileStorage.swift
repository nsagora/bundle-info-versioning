import Foundation

public class FileStorage: Storage {
    
    public init() { }
    
    public func set<T>(value: T?, for key: String) {
        
        guard let value = value else { return }
        
        let environmentDict: NSDictionary = [key: value]
        guard let finalFileURL = getFileURL() else { return }
        environmentDict.write(to: finalFileURL, atomically: true)
    }
    
    public func getValue<T>(for key: String) -> T? {
     
        var environmentDict: NSDictionary?
        if let url = getFileURL() {
            environmentDict = NSDictionary(contentsOf: url)
        }
        if let environmentDict = environmentDict {
            return environmentDict[key] as? T
        }

        return nil
    }
    
    private func getFileURL() -> URL? {

        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let url = urls.first else { return nil }
        
        return url.appendingPathComponent("com.nsagora.bundle-info-observer.plist")
    }
}
