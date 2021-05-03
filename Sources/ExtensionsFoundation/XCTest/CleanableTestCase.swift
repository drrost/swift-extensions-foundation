//
//  CleanableTestCase.swift
//
//
//  Created by Rostyslav Druzhchenko on 03.05.2021.
//

import XCTest

open class CleanableTestCase: XCTestCase {

    open var directoriesToDelete: [String] { [String]() }

    override open func setUp() {
        deleteDirectories()
    }

    override open func tearDown() {
        deleteDirectories()
    }

    func deleteDirectories() {
        try! deleteDirs(directoriesToDelete)
    }
}
