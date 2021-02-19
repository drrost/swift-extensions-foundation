//
//  StringRegexTests.swift
//
//
//  Created by Rostyslav Druzhchenko on 19.02.2021.
//

import XCTest

@testable import ExtensionsFoundation

class StringRegexTests: XCTestCase {

    // MARK: - Init tests

    func testFindName() {
        // Given
        let regex = "(?<=\\\")(.*?)(?=\\\")"
        let text = "some text with \"NamE\" that we want to find"

        // When
        let result = try! text.regex(regex)

        // Then
        XCTAssertEqual("NamE", result[0])
    }

    func testThrowsWhenWrongRegex() {
        // Given
        let regex = "(?<=\\\")(.*?)(?=\\)"
        let text = "some text with \"NamE\" that we want to find"

        // When
        // Then
        XCTAssertThrowsError(try text.regex(regex))
    }

    func testFindNameFirst() {
        // Given
        let regex = "(?<=\\\")(.*?)(?=\\\")"
        let text = "some text with \"NamE\" that we want to find"

        // When
        let result = try! text.regexFirst(regex)

        // Then
        XCTAssertEqual("NamE", result)
    }
}
