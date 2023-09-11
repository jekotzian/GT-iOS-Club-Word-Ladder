//
//  ChangePassWView.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/13/23.
//

import SwiftUI

struct ChangePassWView: View {
    @State var newPass:String = ""
    @State var currPass: String = ""
    @EnvironmentObject var userViewModel: UserAuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                Image("ChangePassWView").offset(y: 90)
                Image("ChangePassWViewProfile").offset(y:-230)
                Image("ChangePassWViewBox")
                VStack {
                    TextField("Current Password", text: $currPass).autocapitalization(.none)
                        .textFieldStyle(UserNameTextFieldStyle())
                        .padding()
                        .frame(width: 300).shadow(radius: 5, y:5)
                        .padding()
                        .offset(y: 40)
                    SecureField("New Password", text: $newPass).autocapitalization(.none)
                        .textFieldStyle(UserNameTextFieldStyle())
                        .frame(width: 270).shadow(radius: 5,y:5)
                        .padding()
                        .offset(y: 20)
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel").font(Font.custom("Bungee-Regular", size:15))
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth: 300)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(20)
                                .shadow(color: .gray, radius: 4, y: 5)
                        }.padding()
                        Button {
                            if let user = userViewModel.currentUser {
                                    userViewModel.changePassword(email: user.email, currentPass: currPass, newPass: newPass)
                            }
                        } label: {
                            Text("Save").font(Font.custom("Bungee-Regular", size:16))
                                .foregroundColor(.white)
                                .frame(height: 50)
                                .frame(maxWidth: 300)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(20)
                                .shadow(color: .gray, radius: 4, y: 5)
                        }.padding()
                    }.offset(y: 200)
                }
            }
        }
    }
}

struct ChangePassWView_Preview: PreviewProvider {
    static var previews: some View {
        ChangePassWView()
    }
}
