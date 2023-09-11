//
//  UserProfileView.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/12/23.
//

import SwiftUI

struct UserProfileView: View {
    
    @EnvironmentObject var userViewModel: UserAuthViewModel
    var body: some View {
        NavigationStack {
            if let user = userViewModel.currentUser {
                VStack {
                    Text(user.initials)
                    Text(user.name)
                    Text(user.email)
                    Button {
                        userViewModel.signOut()
                    } label: {
                        HStack {
                            Text("Sign Out")
                        }
                    }
                    Button {
                        userViewModel.deleteUser()
                    } label: {
                        HStack {
                            Text("Delete Account")
                        }
                    }
                    NavigationLink {
                        ChangePassWView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("Change Password")
                        }
                    }
                }
            }
        }
    }
}

struct UserProfileView_Preview: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
