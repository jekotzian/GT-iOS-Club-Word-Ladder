//
//  DropdownMenuOption.swift
//  Word Ladder
//
//  Created by Lauren Pak on 9/14/23.
//

import Foundation

struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let testSingleTheme: DropdownMenuOption = DropdownMenuOption(option: "None")
    static let testAllThemes: [DropdownMenuOption] = [
    DropdownMenuOption(option: "Christmas"),
    DropdownMenuOption(option: "Animals"),
    DropdownMenuOption(option: "Colors")
    ]
}
