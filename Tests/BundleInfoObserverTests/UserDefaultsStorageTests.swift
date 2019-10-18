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
    
    func test_getValue() {

        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        sut.set(value: "value", for: "key")
        
        //act
        let expected = sut.getValue(for: "key") as String?
        
        //assert
        XCTAssertEqual(expected, "value")
    }
    
    func test_keyComposition_whenSavingValue() {
        
        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        
        //act
        sut.set(value: "value", for: "key")
        
        //assert
        XCTAssertEqual(userDefaults.composedKey, "com.nsagora.storage.key")
    }
    
    func test_keyPathComposition_whenSavingValue() {
        
        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        
        //act
        sut.set(value: "value", for: "key/path")
        
        //assert
        XCTAssertEqual(userDefaults.composedKey, "com.nsagora.storage.key-path")
    }

    func test_keyComposition_whenGettingValue() {
        
        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        sut.set(value: "value", for: "key")
        
        //act
        let _  = sut.getValue(for: "key") as String?
        
        //assert
        XCTAssertEqual(userDefaults.composedKey, "com.nsagora.storage.key")
    }
    
    func test_keyPathComposition_whenGettingValue() {
        
        //arrange
        let userDefaults = FakeUserDefaults<String>()
        let sut = UserDefaultsStorage(userDefaults: userDefaults)
        sut.set(value: "value", for: "key/path")
        
        //act
        let _  = sut.getValue(for: "key/path") as String?
        
        //assert
        XCTAssertEqual(userDefaults.composedKey, "com.nsagora.storage.key-path")
    }
    
    static var allTests = [
        ("test_saveValue", test_saveValue),
        ("test_keyComposition_whenSavingValue", test_keyComposition_whenSavingValue),
        ("test_keyPathComposition_whenSavingValue", test_keyPathComposition_whenSavingValue),
        ("test_getValue", test_getValue),
        ("test_keyComposition_whenGettingValue", test_keyComposition_whenGettingValue),
        ("test_keyPathComposition_whenGettingValue", test_keyPathComposition_whenGettingValue),
    ]
}
