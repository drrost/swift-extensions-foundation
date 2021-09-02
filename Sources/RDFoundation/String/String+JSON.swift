//
//  String+JSON.swift
//
//
//  Created by Rostyslav Druzhchenko on 02.09.2021.
//

import Foundation

public extension String {

    func prettyJson() throws -> String {

        try commonJson([.prettyPrinted])
    }

    func shrinkedJson() throws -> String {

        try commonJson([])
    }

    private func commonJson(
        _ options: JSONSerialization.WritingOptions) throws -> String {

        if self.count == 0 {
            return ""
        }

        let jsonObj = try JSONSerialization.jsonObject(with: Data(self.utf8))

        let data = try JSONSerialization.data(
            withJSONObject: jsonObj, options: options)

        return String(data: data, encoding: .utf8)!
    }
}
