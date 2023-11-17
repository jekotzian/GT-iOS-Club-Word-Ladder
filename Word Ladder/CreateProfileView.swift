//
//  CreateProfileView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 11/10/23.
//

import SwiftUI
//TODO: change font style
struct CreateProfileView: View {
    @State private var userInput: String = ""
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var activeProfile: Int? = nil
    
    var body: some View {
        ZStack {
            Color.init(red: 0.96078431372, green: 0.91372549019, blue: 0.91372549019)
                            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ZStack {
                    Image("Ellipse 30")
                        .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 3)
                    ForEach(0..<12) { index in
                        Image("Group \(15 + index)")
                            .onTapGesture {
                                if activeProfile == index {
                                    activeProfile = nil
                                } else {
                                    activeProfile = index
                                }
                            }
                            .opacity(activeProfile == index ? 1.0 : 0.0)
                    }
                }
                   
                ZStack {
                    Image("Rectangle 49")
                        .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 3)
                    VStack {
                        Text ("Edit Avatar")
                            .offset(x: -105)
                        Image("Vector 179")
                        HStack (spacing: 25) {
                            Image("small blue").onTapGesture { activeProfile = 0 } //15
                            Image("small green").onTapGesture { activeProfile = 1 } //16
                            Image("small pink").onTapGesture { activeProfile = 2 } //17
                            Image("small yellow").onTapGesture { activeProfile = 3 } //18
                        }
                        HStack (spacing: 25) {
                            Image("blueberry").onTapGesture { activeProfile = 4 } //19
                            Image("kiwi").onTapGesture { activeProfile = 5 } //20
                            Image("strawberry").onTapGesture { activeProfile = 6 } //21
                            Image("lemon").onTapGesture { activeProfile = 7 } //22
                        }
                        HStack (spacing: 25) {
                            Image("fish").onTapGesture { activeProfile = 8 } //23
                            Image("dino").onTapGesture { activeProfile = 9 } //24
                            Image("octo").onTapGesture { activeProfile = 10 } //25
                            Image("chick").onTapGesture { activeProfile = 11 } //26
                        }
                        
                    }
                }
                .padding()
                VStack {
                    HStack (spacing: 18){
                        TextField("First", text: $userInput)
                            .padding()
                            .frame(width: 160)
                            .frame(height: 45)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 3)
                        TextField("Last", text: $userInput)
                            .padding()
                            .frame(width: 160)
                            .frame(height: 45)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 3)
                    }
                    TextField("Email", text: $emailInput)
                        .padding()
                        .frame(width: 340)
                        .frame(height: 45)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(15)
                        .font(Font.custom("Bungee-Regular", size: 16))
                        .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 3)
                    SecureField("Password", text: $passwordInput)
                        .padding()
                        .frame(width: 340)
                        .frame(height: 45)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(15)
                        .font(Font.custom("Bungee-Regular", size: 16))
                        .shadow(color: Color.gray.opacity(0.4), radius: 1, x: 1, y: 3)
                    Spacer()
                    VStack {
                        HStack (spacing: 18) {
                            Button(action: {
                            }) {
                                VStack {
                                    Text("Cancel")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 160)
                                        .frame(height: 45)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .cornerRadius(15)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 2, y: 2)
                                }
                            }
                            
                            Button(action: {
                            }) {
                                VStack {
                                    Text("Save")
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: 160)
                                        .frame(height: 45)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .cornerRadius(15)
                                        .font(Font.custom("Bungee-Regular", size: 16))
                                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 2, y: 2)
                                }
                            }
                            
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}

