//
//  StringTestsAppending.swift
//
//
//  Created by Rostyslav Druzhchenko on 19.02.2021.
//

import XCTest

@testable import ExtensionsFoundation

class StringTestsAppending: XCTestCase {

    // MARK: - Init tests

    func testAppendingPathComponent() {
        // Given
        let path = "/abc/abd"
        let component = "Package.swift"

        // When
        let result = path.appendingPathComponent(component)

        // Then
        XCTAssertEqual("/abc/abd/Package.swift", result)
    }

    func testAppendingPathComponentWithDot() {
        // Given
        let path = "/abc/abd"
        let component = "./zzz/xyz"

        // When
        let result = path.appendingPathComponent(component)

        // Then
        XCTAssertEqual("/abc/abd/zzz/xyz", result)
    }
}
