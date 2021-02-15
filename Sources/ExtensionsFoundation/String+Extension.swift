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
}
