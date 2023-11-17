//
//  GameSettingView.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 11/13/23.
//

import SwiftUI

struct GameSettingView: View {
    @State var charBonus = true
    @State var longWordBonus = true
    @State var teamMode = true
    @State var selectedMinChar = "Select Time Limit"
    @State var selectedTimeLimit = "Select Min Character"
    var body: some View {
        NavigationStack{
            ZStack {
                Image("GameSettingViewRec").offset(y: -310).ignoresSafeArea().aspectRatio(contentMode: .fill)
                Image("GameSettingViewDots").offset(y: -310).ignoresSafeArea().aspectRatio(contentMode: .fill)
                Image("GameSettingViewBox").offset(y: -50).shadow(color: .gray, radius: 4, y: 5)
                VStack {
                    Spacer()
                    Text("Create Game")
                        .font(Font.custom("Bungee-Regular", size: 44))
                    Text("Settings")
                        .font(Font.custom("Bungee-Regular", size: 44))
                    List {
                        Section {
                            Picker("Time Limit", selection: $selectedTimeLimit) {
                                Text("Select Time Limit").tag("Select Time Limit")
                            }
                            Picker("Minimum Character", selection: $selectedMinChar) {
                                Text("Select Min Character").tag("Select Min Character")
                            }
                            Toggle("Character Bonus", isOn: $charBonus)
                            Toggle("Long Word Bonus", isOn: $longWordBonus)
                            Toggle("Team Mode", isOn: $teamMode)
                        }
                    }.scrollContentBackground(.hidden).frame(width: 370).offset(y: 30)
                    HStack {
                        Button {
                            //
                        } label: {
                            Text("Cancel")
                            .font(Font.custom("Bungee-Regular", size:15))
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: 315)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 4, y: 5)
                        }.padding()
                        
                        Button {
                            //
                        } label: {
                            Text("Create")
                            .font(Font.custom("Bungee-Regular", size:15))
                            .foregroundColor(.white)
                            .frame(height: 50)
                            .frame(maxWidth: 315)
                            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 4, y: 5)
                        }.padding()
                    }.frame(width: 370 , height: 100)
                }
            }
                            
                        
            
        }
        
    }
}

struct GameSettingView_Preview: PreviewProvider {
    static var previews: some View {
        GameSettingView()
    }
}
