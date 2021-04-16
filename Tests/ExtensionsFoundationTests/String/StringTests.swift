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

    func testOccurrencesCount() {
        // Given
        let sql = "UPDATE user SET first_name = ?, last_name = ?, age = ? WHERE first_name = ?;"

        // When
        let count = sql.occurrencesCount("?")

        // Then
        XCTAssertEqual(4, count)
    }

    func testReplaceFirst() {
        // Given
        var sql = "UPDATE user SET first_name = ?, last_name = ?, age = ? WHERE first_name = ?;"

        // When
        sql = sql.replaceFirstOccurrence("?", "'abc'")
        sql = sql.replaceFirstOccurrence("?", "'xyz'")
        sql = sql.replaceFirstOccurrence("?", "1")
        sql = sql.replaceFirstOccurrence("?", "'John'")

        // Then
        XCTAssertEqual(
            "UPDATE user SET first_name = 'abc', last_name = 'xyz', age = 1" +
                " WHERE first_name = 'John';", sql)
    }

    func testLastPahtComponent() {
        // Given
        let path = "/tmp/some/root"

        // When
        let last = path.lastPathComponent

        // Then
        XCTAssertEqual("root", last)
    }

    func testResolvePath() {
        // Given
        let path = "~/"

        // When
        let resolved = path.resolve

        // Then
        XCTAssertTrue(resolved.starts(with: "/Users/"))
    }
}
