//
//  String+Extension.swift
//
//
//  Created by Rostyslav Druzhchenko on 15.02.2021.
//

import Foundation

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
}
