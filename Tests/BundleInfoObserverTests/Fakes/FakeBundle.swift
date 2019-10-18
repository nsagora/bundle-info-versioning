import Foundation

class FakeBundle: Bundle {
    
    var fakeInfoDictionary: [String : Any]?
    
    override var infoDictionary: [String : Any]? {
        return fakeInfoDictionary
    }
}
