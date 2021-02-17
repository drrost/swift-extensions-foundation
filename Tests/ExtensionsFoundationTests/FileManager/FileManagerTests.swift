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
            try! FileManager.delete(path)
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
        try! FileManager.delete(path)
    }

    func testCreateFileWithDir() {
        // Given
        let path = FileManager.getDocumentsDirectory().appending("dir/test.txt")
        if FileManager.exists(path) {
            try! FileManager.delete(path)
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
        try! FileManager.delete(path)
    }

    func testCreateDirWithIntermediates() {
        // Given
        let pathRoot = FileManager.getDocumentsDirectory().appending("dir1")
        if FileManager.exists(pathRoot) {
            try! FileManager.delete(pathRoot)
        }
        let pathFull = FileManager.getDocumentsDirectory().appending("dir1/dir2/dir3")

        // When
        do {
            try FileManager.createDirectory(pathFull)
        } catch {
            print(error)
            XCTAssertTrue(false, "Call should not throw")
        }

        // Then
        XCTAssertTrue(FileManager.exists(pathFull))
        try! FileManager.delete(pathRoot)
    }
}
