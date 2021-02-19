//
//  String+Extension.swift
//
//
//  Created by Rostyslav Druzhchenko on 15.02.2021.
//

import Foundation

public class StringError: Error {

    let message: String

    init(_ message: String) {
        self.message = message
    }
}

public extension String {

    func trim() -> String {
        self.trimmingCharacters(in: .whitespaces)
    }

    func split(_ speparator: String) -> [String] {
        (self as NSString).components(separatedBy: speparator)
    }

    init(contentsOf path: String) throws {
        let url = URL.init(fileURLWithPath: path)
        self = try String(contentsOf: url)
    }

    func appendingPathComponent(_ component: String) -> String {
        let path = (self as NSString).appendingPathComponent(component)
        return (path as NSString).standardizingPath
    }

    func regex(_ regex: String) throws -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(
                in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            throw StringError("invalid regex: \(error.localizedDescription)")
        }
    }

    func regexFirst(_ regex: String) throws -> String {
        let result = try self.regex(regex)
        if result.count == 0 {
            throw StringError("No matches found")
        }
        return result[0]
    }
}
