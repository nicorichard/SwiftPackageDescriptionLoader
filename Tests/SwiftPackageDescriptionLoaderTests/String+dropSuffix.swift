import Foundation
import XCTest
@testable import SwiftPackageDescriptionLoader

final class StringDropSuffixTests: XCTestCase {
    func testGivenAMatchingSuffix_itIsDropped() throws {
        XCTAssertEqual("Package.swift".dropSuffix("Package.swift"), "")
    }
    
    func testGivenANonMatchingSuffix_itIsNotDropped() throws {
        XCTAssertEqual("Package.swift".dropSuffix("Package.json"), "Package.swift")
    }
}
