//
//  WaitingRoomView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 9/13/23.
//

import SwiftUI

struct WaitingRoomView: View {
    var body: some View {
        
        VStack {
            
            Text("Waiting room...")
                .font(.largeTitle)
                .offset(y: 50)
                .bold()
            GeometryReader { geometry in
                    //display joiners of the game?
                        VStack(alignment: .leading, spacing: 10) {
                            Text("").font(.largeTitle)
                            Text("").font(.headline)
                            HStack(spacing: 0) {
                                Text(" ").font(.caption).foregroundColor(.gray)
                                Text(" ").font(.caption).fontWeight(.bold).foregroundColor(.blue)
                                Text(".").font(.caption).foregroundColor(.gray)
                            }
                            
                        }.frame(width: geometry.size.width/1.3, height: 200)
                            .background(Color.white)
                            .padding(.leading, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 2))
                            .offset(x: 38, y: 40)
                    }
            HStack (spacing: 18){
                Button (action:  {
                }, label: {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .frame(maxWidth: 165)
                        .background(Color.blue)
                        .cornerRadius(15)
                    
                })
               
                Button (action: {
                    
                }, label: {
                    Text("Ready")
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
        
        
    }
}

struct WaitingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomView()
    }
}
