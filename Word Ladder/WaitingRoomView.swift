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
            GeometryReader { geometry in
                    
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
                                    .stroke(Color.blue, lineWidth: 2))
                    }
        }
        
        
    }
}

struct WaitingRoomView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingRoomView()
    }
}
