//
//  UserAuthViewModel.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


//If we want to have some rule for authentification
protocol AuthentificationRule {
    var validForm: Bool{get}
}
//publish all ui updates back to the main thread
@MainActor
class UserAuthViewModel: ObservableObject {
    //is user logged in?
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    //message to send
    
    init() {
        //to keep users logged in
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUserData()
        }
    }
    
    func createUser(email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            //create User instance using the uid provided by the firebase
            let user = User(id: result.user.uid, name: name, email: email)
            //encode the user into JSON data to upload it to firebase
             let encodeUser = try Firestore.Encoder().encode(user)
            //set encoded user in firestore
            try await Firestore.firestore().collection("Users").document(user.id).setData(encodeUser)
            await fetchUserData()
        } catch {
            print("Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let signedUser = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = signedUser.user
            await fetchUserData()
        } catch {
            print("Failed to sign in with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            //signs out the user in firebase
            try Auth.auth().signOut()
            //reset currentUser and userSession
            self.currentUser = nil
            self.userSession = nil
        } catch {
            print("Failed to sign out with error : \(error.localizedDescription)")
        }
    }
    
    func deleteUser() {
        //delete firestore document with corresponding id
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("Users").document(uid).delete()
        //delete authetification info
        userSession?.delete()
        self.currentUser = nil
        self.userSession = nil
    }
    
    func fetchUserData() async {
        //fetch using the user id
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("Users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    
    func changePassword(email: String, currentPass: String, newPass: String) {
        let credential = EmailAuthProvider.credential(withEmail: email, password: currentPass)
        let user = Auth.auth().currentUser

        user?.reauthenticate(with: credential, completion: { (result, error) in
           if let err = error {
               print("Failed to re-autentificate with error: \(err.localizedDescription)")
           } else {
               Auth.auth().currentUser?.updatePassword(to: newPass) { (error) in
                   if let error = error {
                       print("Failed to change password: \(error.localizedDescription)")
                   }
               }
           }
        })
    }
    //
    func resetPassword(email: String) async throws {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            print("yay")
        } catch {
            print("Failed to resetPassword with error: \(error.localizedDescription)")
        }
    }
}
