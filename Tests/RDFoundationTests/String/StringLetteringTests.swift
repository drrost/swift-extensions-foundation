//
//  StringLetteringTests.swift
//
//
//  Created by Rostyslav Druzhchenko on 06.06.2021.
//

import XCTest

@testable import RDFoundation

class UnitTestTemplateTests: XCTestCase {

    // MARK: - Init tests

    func testCapitalizingFirstLetterInAllWords() {
        // Given
        let string = "and others that are found in major traditions"

        // When
        let result = string.capitalizeAllFirstLetters()

        // Then
        XCTAssertEqual("And Others That Are Found In Major Traditions", result)
    }
}
