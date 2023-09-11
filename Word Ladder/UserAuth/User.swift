//
//  User.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/9/23.
//

import Foundation
struct User: Identifiable, Codable{
    let id: String
    let name: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let componenets = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: componenets)
        }
        return ""
    }
}
