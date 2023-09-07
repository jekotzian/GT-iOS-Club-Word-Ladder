//
//  Word_LadderApp.swift
//  Word Ladder
//
//  Created by Jake Kotzian on 9/6/23.
//

import SwiftUI
import Firebase
@main
struct Word_LadderApp: App {
    init() {
        FirebaseApp.configure()
        //print("--Configured Firebase--")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
