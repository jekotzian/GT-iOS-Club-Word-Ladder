//
//  RulesView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 9/13/23.
//

import SwiftUI

struct RulesView: View {
    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                    //display joiners of the game?
                        VStack(alignment: .leading, spacing: 150) {
                            Text("Rules")
                                .font(.largeTitle)
                            Text("1.").offset(x: -90, y: -140)
                            
                            HStack(spacing: 0) {
                                Text(" ").font(.caption).foregroundColor(.gray)
                                Text(" ").font(.caption).fontWeight(.bold).foregroundColor(.blue)
                                Text(".").font(.caption).foregroundColor(.gray)
                            }
                            
                        }.frame(width: geometry.size.width/1.3, height: 400)
                            .background(Color.white)
                            .padding(.leading, 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 2))
                            .offset(x: 38, y: 40)
                    }
            
        }
        
        
    }
    
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
