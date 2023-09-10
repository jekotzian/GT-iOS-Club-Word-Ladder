//
//  UserAnswerView.swift
//  Word Ladder
//
//  Created by Jiyoon Lee on 9/9/23.
//

import SwiftUI

struct UserAnswerView: View {
    //Timer
    @State var countDownFrom = 10
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //TextField
    @State private var text = ""
    @State private var answer = ""
    
    @State private var invalidWord = 0
    //creating label for button so that we can click on anywhere in the box
    struct answerButton: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 40)
                    .cornerRadius(20)
                
                Text("Enter")
                    .foregroundColor(.black)
            }
        }
    }
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                
                VStack {
                    Text("\(answer)")
                }
            }
            
            Spacer()
            HStack {
                //Timer
                Text("\(countDownFrom)")
                    .onReceive(timer) {
                        _ in
                        if countDownFrom > 0 && timerRunning {
                            countDownFrom -= 1
                        } else {
                            timerRunning = false
                        }
                    }
                    .font(.system(size: 30, weight: .bold))
                    .padding()
                
                //Answer TextField
                VStack(alignment: .leading, spacing: 10) {
                    TextField("Enter a word", text: $text)
                        .padding(10)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(20)
                        //for wrong input
                        .border(.red, width: CGFloat(invalidWord))
                }
                
                //Enter button
                Button {
                    countDownFrom = 10
                    answer = text
                    text = ""
                } label: {
                    answerButton()
                }
                .padding()
                
            }
            .padding()
        }
        
    }
}

struct UserAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        UserAnswerView()
    }
}
