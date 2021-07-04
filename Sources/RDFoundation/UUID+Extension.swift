//
//  UUID+Extension.swift
//
//
//  Created by Rostyslav Druzhchenko on 29.04.2021.
//

import Foundation

public extension UUID {

    var toString: String {
        self.uuidString
    }

    init?(_ uuidString: String) {
        self.init(uuidString: uuidString)
    }
}
