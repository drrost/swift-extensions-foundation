//
//  StringTestSplit.swift
//
//
//  Created by Rostyslav Druzhchenko on 16.02.2021.
//

import XCTest

@testable import ExtensionsFoundation

class StringTestSplit: XCTestCase {

    // MARK: - Init tests

    func testSeparationOneSymbol() {
        // Given
        let string = "abcdef.xyz"
        let separator = "."

        // When
        let array = string.split(separator)

        // Then
        XCTAssertEqual(2, array.count)
        XCTAssertEqual("abcdef", array[0])
        XCTAssertEqual("xyz", array[1])
    }

    func testSeparationManySymbols() {
        // Given
        let string = "abcdef.xyz.qwerty.xyz.asdfg"
        let separator = ".xyz."

        // When
        let array = string.split(separator)

        // Then
        XCTAssertEqual(3, array.count)
        XCTAssertEqual("abcdef", array[0])
        XCTAssertEqual("qwerty", array[1])
        XCTAssertEqual("asdfg", array[2])
    }

    func testSeparatorNotFound() {
        // Given
        let string = "abcdef.xyz.qwerty.xyz.asdfg"
        let separator = ".xyzz."

        // When
        let array = string.split(separator)

        // Then
        XCTAssertEqual(1, array.count)
        XCTAssertEqual("abcdef.xyz.qwerty.xyz.asdfg", array[0])
    }
}
