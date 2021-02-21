//
//  StringTests.swift
//
//
//  Created by Rostyslav Druzhchenko on 15.02.2021.
//

import XCTest

@testable import ExtensionsFoundation

class StringTests: XCTestCase {

    // MARK: - Init tests

    func testTrim() {
        // Given
        let string = "   abc  "

        // When
        let trimmed = string.trim()

        // Then
        XCTAssertEqual("abc", trimmed)
    }

    func testTrimWithNewLines() {
        // Given
        let string = "\n \n   abc  \n\n"

        // When
        let trimmed = string.trimN()

        // Then
        XCTAssertEqual("abc", trimmed)
    }
}
