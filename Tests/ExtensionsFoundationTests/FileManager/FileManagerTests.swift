//
//  FileManagerTests.swift
//
//
//  Created by Rostyslav Druzhchenko on 17.02.2021.
//

import XCTest

@testable import ExtensionsFoundation

class FileManagerTests: XCTestCase {

    // MARK: - Init tests

    func testCreation() {
        // Given
        // When
        let path = FileManager.getDocumentsDirectory()

        // Then
        XCTAssertTrue(path.hasSuffix("/Documents"))
        XCTAssertFalse(path.hasPrefix("file://"))
    }
}
