//
//  String+Extension.swift
//
//
//  Created by Rostyslav Druzhchenko on 15.02.2021.
//

import Foundation

public class StringError: NSObject, LocalizedError {

    let message: String

    init(_ message: String) {
        self.message = message
    }

    public override var description: String { get { message } }
    public var errorDescription: String? { get { description } }
}

public extension String {

    func trim() -> String {
        self.trimmingCharacters(in: .whitespaces)
    }

    func trimN() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func split(_ speparator: String) -> [String] {
        var array = (self as NSString).components(separatedBy: speparator)
        if array[array.count - 1].count == 0 {
            array.removeLast()
        }
        return array
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

    func occurrencesCount(_ substring: String) -> Int {
        self.components(separatedBy: substring).count - 1
    }

    func replaceFirstOccurrence(
        _ target: String, _ replaceString: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }

    var lastPathComponent: String {
        (self as NSString).lastPathComponent
    }

    var resolve: String {
        (self as NSString).standardizingPath
    }

    func starts(_ with: String) -> Bool {
        starts(with: with)
    }

    func ends(_ with: String) -> Bool {
        hasSuffix(with)
    }
}
