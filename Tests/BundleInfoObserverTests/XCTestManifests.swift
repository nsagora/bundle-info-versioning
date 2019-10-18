import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BundleInfoObserverTests.allTests),
        testCase(UserDefaultsStorageTests.allTests),
    ]
}
#endif
