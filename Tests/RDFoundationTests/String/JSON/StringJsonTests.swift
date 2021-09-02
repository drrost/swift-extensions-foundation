//
//  StringJsonTests.swift
//
//
//  Created by Rostyslav Druzhchenko on 02.09.2021.
//

import XCTest

@testable import RDFoundation

class StringJsonTests: XCTestCase {

    // MARK: - Init tests

    func testEmptyPretty() {
        // Given
        let json = ""

        // When
        let pretty = try! json.prettyJson()

        // Then
        XCTAssertEqual("", pretty)
    }

    func testEmptyShrink() {
        // Given
        let json = ""

        // When
        let shrinked = try! json.shrinkedJson()

        // Then
        XCTAssertEqual("", shrinked)
    }

    func testPrettyEmptyOjbect() {
        // Given
        let json = "{}"

        // When
        let pretty = try! json.prettyJson()

        // Then
        XCTAssertEqual("{\n\n}", pretty)
    }

    func testPrettyShrinkedOjbect() {
        // Given
        let json = "{\n\n   }"

        // When
        let shrinked = try! json.shrinkedJson()

        // Then
        XCTAssertEqual("{}", shrinked)
    }

    func testInvalidJsonPretty() {
        // Given
        let json = "{"

        // When
        let pretty = try? json.prettyJson()

        // Then
        XCTAssertNil(pretty)
    }

    func testUserSrinkedToPretty() {
        // Given
        let json = #"{"firstName":"John","age":36,"lastName":"Smith"}"#

        // When
        let pretty = try! json.prettyJson()

        // Then
        XCTAssertEqual(#"""
            {
              "firstName" : "John",
              "age" : 36,
              "lastName" : "Smith"
            }
            """#, pretty)
    }

    func testUserPrettyToSrinked() {
        // Given
        let json = #"""
            {
            "firstName" : "John",
            "age" : 36,
            "lastName" : "Smith"
            }
            """#

        // When
        let pretty = try! json.shrinkedJson()

        // Then
        XCTAssertEqual(
            #"{"firstName":"John","age":36,"lastName":"Smith"}"#, pretty)
    }
}

