//
//  ContentView.swift
//  Word Ladder
//
//  Created by Jake Kotzian on 9/6/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserAuthViewModel
    var body: some View {
        Group {
            if userViewModel.userSession != nil {
                UserProfileView()
            } else {
                HomePageView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

