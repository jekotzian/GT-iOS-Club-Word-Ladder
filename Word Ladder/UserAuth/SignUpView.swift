//
//  SignUpView.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/12/23.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @EnvironmentObject var userViewModel: UserAuthViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack{
                TextField("Name", text: $name).autocapitalization(.none)
                TextField("Email", text: $email).autocapitalization(.none)
                TextField("Password", text: $password).autocapitalization(.none)
                Button {
                    //async - need to wrap in task
                    Task {
                        try await                     userViewModel.createUser(email: email, password: password, name: name)
                    }
                } label: {
                    HStack {
                        Text("Sign Up")
                    }
                }
                .disabled(!validForm)
                Button {
                    dismiss()
                } label: {
                    Text("Already have an account?")
                }
                
            }
        }
    }
}
extension SignUpView: AuthentificationRule {
    var validForm: Bool {
        return !email.isEmpty && email.contains("@") && email.contains(".") && !password.isEmpty && password.count > 5 && !name.isEmpty
    }
}
struct SignUpView_Preview: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
