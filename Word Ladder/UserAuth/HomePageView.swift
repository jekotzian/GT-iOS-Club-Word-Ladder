//
//  HomePageView.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/12/23.
//

import SwiftUI

struct HomePageView: View {
    @State var password: String = ""
    @State var email: String = ""
    //use EnvironmentObject to initialize in one place and use it across multiple places
    @EnvironmentObject var userViewModel: UserAuthViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                //Color(red: 0.96, green: 0.91, blue: 0.91).ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Word")
                        .font(Font.custom("Bungee-Regular", size: 44))
                    Text("Ladder")
                        .font(Font.custom("Bungee-Regular", size: 44))
                    TextField("Email", text: $email).autocapitalization(.none)
                        .textFieldStyle(UserNameTextFieldStyle())
                        .padding()
                        .frame(width: 350).shadow(radius: 5, y:5)
                    
                    SecureField("password", text: $password).autocapitalization(.none)
                        .textFieldStyle(UserNameTextFieldStyle())
                        .frame(width:320).shadow(radius: 5,y:5)
                    Button (action: {
                        //async - need to wrap in task
                        Task {
                            try await                     userViewModel.signIn(email: email, password: password)
                        }
                    }, label: {
                        Text("Log In")
                            .font(Font.custom("Bungee-Regular", size:15))
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: 315)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 4, y: 5)
                    }) .offset(y:35).disabled(!validForm)
                    Button (action: {
                        //async - need to wrap in task
                        Task {
                            try await                     userViewModel.resetPassword(email: email)
                        }
                    }, label: {
                        Text("Forgot password")
                    }).offset(y:-200)
                    NavigationLink {
                        SignUpView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Don't have an account? Sign Up")
                            .font(.system(size:10))
                            .padding(.top, 50)
                            .foregroundColor(.black).underline()
                    }
                }
            }
            //                    .background(
            //                        Image("HomePageBackground")
            //                            .ignoresSafeArea()
            //                            .aspectRatio(contentMode: .fill)
            //                            
            //                    )
            .background(
                Color(red: 0.96, green: 0.91, blue: 0.91).ignoresSafeArea().aspectRatio(contentMode: .fill)
            )
            
        }
        
    }
}
struct UserNameTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(height: 50)
            )
    }
}

extension HomePageView: AuthentificationRule {
    var validForm: Bool {
        return !email.isEmpty && email.contains("@") && email.contains(".") && !password.isEmpty && password.count > 5
    }
}
struct HomePageView_Preview: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
