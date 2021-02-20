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

    static func createFile(_ path: String) throws {
        let url = URL.init(fileURLWithPath: path)
        let pathDir = (path as NSString).deletingLastPathComponent
        try createDirectory(pathDir)
        try "".write(to: url, atomically: true, encoding: .utf8)
    }

    // Deletes file or directory
    //
    static func delete(_ path: String) throws {
        let url = URL.init(fileURLWithPath: path)
        try FileManager.default.removeItem(at: url)
    }

    static func createDirectory(_ path: String) throws {
        let url = URL.init(fileURLWithPath: path)
        try FileManager.default.createDirectory(
            at: url, withIntermediateDirectories: true, attributes: nil)
    }

    static func fileSize(_ path: String) -> UInt64 {
        var fileSize : UInt64

        do {
            let attr = try FileManager.default.attributesOfItem(atPath: path)
            fileSize = attr[FileAttributeKey.size] as! UInt64

            //if you convert to NSDictionary, you can get file size old way as well.
            let dict = attr as NSDictionary
            fileSize = dict.fileSize()
            return fileSize
        } catch {
            return UInt64.max
        }
    }
}
