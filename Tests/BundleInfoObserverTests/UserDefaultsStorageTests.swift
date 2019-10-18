import XCTest
@testable import BundleInfoObserver


final class UserDefaultsStorageTests: XCTestCase {
    
    func test_saveValue() {

        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        
        //act
        sut.set(value: "value", for: "key")
        
        //assert
        XCTAssertEqual(userDefaults.value, "value")
    }
    
    func test_key_whenSavingValue() {
        
        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        
        //act
        sut.set(value: "value", for: "key")
        
        //assert
        XCTAssertEqual(userDefaults.composedKey, "com.nsagora.storage.key")
    }
    
    func test_getValue() {

        //arrange
        let userDefaults = FakeUserDefaults<String>()
        
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        sut.set(value: "value", for: "key")
        
        //act
        let expected: String? = sut.getValue(for: "key")
        
        
        //assert
        XCTAssertEqual(expected, "value")
    }
    
    func test_key_whenGettingValue() {
        
        //arrange
        let userDefaults = FakeUserDefaults<String>()
        
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        sut.set(value: "value", for: "key")
        
        //act
        let _: String? = sut.getValue(for: "key")
        
        //assert
        XCTAssertEqual(userDefaults.composedKey, "com.nsagora.storage.key")
    }
}
