//
//  FileManager+Extension.swift
//
//
//  Created by Rostyslav Druzhchenko on 16.02.2021.
//

import Foundation

public extension FileManager {

    static func exists(_ path: String) -> Bool {
        FileManager.default.fileExists(atPath: path)
    }

    static func copy(_ src: String, _ dst: String) throws {
        try FileManager.default.copyItem(atPath: src, toPath: dst)
    }

    static func getDocumentsDirectory() -> String {
        let paths = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.path
    }
}
