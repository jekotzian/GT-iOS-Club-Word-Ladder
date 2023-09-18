//
//  CreateGameView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 9/13/23.
//

import SwiftUI

struct CreateGameView: View {
    @State private var isOptionsPresented: Bool = false
    //shows or hids drop-down menu options
    @State private var vibrateOnText = false
    //used to bind user selection
    @Binding var selectedOption: DropdownMenuOption?
    //placeholder for drop-down menu
    let placeholder: String
    //drop-down menu options
    let options: [DropdownMenuOption]
    
    var body: some View {
        VStack {
            Text("Game Settings")
                .font(.largeTitle)
                .bold()
            Toggle("No Timer", isOn: $vibrateOnText)
            // do something
                .offset(x: 15)
                .frame(width: 300)
            Button(action: {
                withAnimation{
                    self.isOptionsPresented.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption == nil ? placeholder : selectedOption!.option)
                        .fontWeight(.medium)
                        .foregroundColor(selectedOption == nil ? .gray : .black)
                    Spacer()
                    
                    Image(systemName: self.isOptionsPresented ? "chevron.up" :
                    "chevron.down")
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                }
                
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 2)
            }
            .overlay {
                VStack {
                    if self.isOptionsPresented {
                        Spacer(minLength: 60)
                    }
                }
            }
            .padding(.horizontal)

                
        }
    }
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(
            selectedOption: .constant(nil),
        placeholder: "Theme",
            options: DropdownMenuOption.testAllThemes)
    }
}
