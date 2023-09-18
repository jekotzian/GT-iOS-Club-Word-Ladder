//
//  HomepageView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 9/11/23.
//

import SwiftUI

struct HomepageVIew: View {
    @State private var username : String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("WORD LADDER")
                    .font(.system(size: 36))
                    .bold()
                TextField("Enter Username", text: $username)
                    .padding(10)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(15)
                    .frame(width: 350)
                HStack (spacing: 18){
                    Button (action:  {
                    }, label: {
                        Text("Create Game")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .frame(maxWidth: 165)
                            .background(Color.blue)
                            .cornerRadius(15)
                        
                    })
                   
                    Button (action: {
                        
                    }, label: {
                        Text("Join Game")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(height: 40)
                            .frame(maxWidth: 165)
                            .background(Color.gray)
                            .opacity(0.15)
                            .cornerRadius(15)
                    })
                        
                    
                }
                .padding()
               
            }
            NavigationLink("How to play ?", destination: RulesView())
                .offset(y: 280)
                
        }
        
        

    }
}

struct HomepageVIew_Previews: PreviewProvider {
    static var previews: some View {
        HomepageVIew()
    }
}
