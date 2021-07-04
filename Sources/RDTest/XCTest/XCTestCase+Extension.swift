//
//  XCTestCase+Extension.swift
//  
//
//  Created by Rostyslav Druzhchenko on 30.04.2021.
//

import XCTest

import RDFoundation

public extension XCTestCase {

    func deleteDirs(_ dirs: [String]) throws {
        for dir in dirs {
            if FileManager.exists(dir) {
                try FileManager.delete(dir)
            }
        }
    }
}
