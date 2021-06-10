//
//  String+Lettering.swift
//
//
//  Created by Rostyslav Druzhchenko on 06.06.2021.
//

import Foundation

public extension String {

    func capitalizingFirstLetter() -> String {
        prefix(1).capitalized + dropFirst()
    }

    func capitalizeAllFirstLetters() -> String {
        split(" ").map { $0.capitalizingFirstLetter() }.joined(separator: " ")
    }
}
