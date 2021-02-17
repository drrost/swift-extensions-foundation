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

    func testCreateFile() {
        // Given
        let path = FileManager.getDocumentsDirectory().appending("test.txt")
        if FileManager.exists(path) {
            try! FileManager.deleteFile(path)
        }

        // When
        do {
            try FileManager.createFile(path)
        } catch {
            print(error)
            XCTAssertTrue(false, "Call should not throw")
        }

        // Then
        XCTAssertTrue(FileManager.exists(path))
        try! FileManager.deleteFile(path)
    }
}
