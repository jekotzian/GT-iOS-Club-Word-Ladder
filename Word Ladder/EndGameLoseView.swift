//
//  EndGameLoseView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 9/13/23.
//

import SwiftUI

struct EndGameLoseView: View {
    var body: some View {
        VStack {
            Text("YOU LOST!")
                .font(.largeTitle)
                .bold()
                .offset(y: 40)
                
            Spacer()
                .frame(height: 400)
            
            GeometryReader { geometry in
                VStack {
                    Text("SCORE: 0000")
                        .bold()
                        .font(.title)
                        .offset(y: -50)
                    HStack {
                        VStack {
                            Text("WORD 0000")
                                .frame(width: 100)
                            Text("WORD 0000")
                                .frame(width: 100)
                        }
                        .offset(x: -20)
                        VStack {
                            Text("WORD 0000")
                                .frame(width: 100)
                            Text("WORD 0000")
                                .frame(width: 100)
                        }
                        .offset(x: 20)
                        
                        
                    }
                    //add animation/image
                    
                }.frame(width: geometry.size.width/1.3, height: 200)
                    .background(Color.white)
                    .padding(.leading, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2))
                    .offset(x: 38, y: 40)
            }
            HStack {
                Button (action:  {
                }, label: {
                    Text("End Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .frame(maxWidth: 165)
                        .background(Color.blue)
                        .cornerRadius(15)
                    
                })
               
                Button (action: {
                }, label: {
                    Text("Play Again")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(height: 40)
                        .frame(maxWidth: 165)
                        .background(Color.gray)
                        .opacity(0.15)
                        .cornerRadius(15)
                })
            }
            
            
        }
        
    }
}

struct EndGameLoseView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameLoseView()
    }
}
