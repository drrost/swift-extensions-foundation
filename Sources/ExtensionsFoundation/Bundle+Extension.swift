//
//  Bundle+Extension.swift
//
//
//  Created by Rostyslav Druzhchenko on 16.02.2021.
//

import Foundation

public extension Bundle {

    func path(for resource: String) -> String? {

        let array = resource.split(".")

        if array.count > 1 {
            return path(forResource: array[0], ofType: array[1])
        }

        return path(forResource: array[0], ofType: "")
    }
}
