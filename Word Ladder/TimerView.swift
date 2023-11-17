//
//  TimerView.swift
//  Word Ladder
//
//  Created by Lauren Pak on 11/14/23.
//

import SwiftUI


struct TimerView: View {
    @State private var index = 0
    @State private var timerCount = 0
    @State private var maxTimerCount = 2
    @State private var isTimerRunning = true;
    var body: some View {
        let images = ["timer", "Vector 172", "timer2 (1)"]
        
//        NavigationLink(destination: CreateGameView, isActive: $isTimerRunning) {
//                    EmptyView()
//                }
//                .hidden()
        ZStack {
            Color.init(red: 0.96078431372, green: 0.91372549019, blue: 0.91372549019)
                            .ignoresSafeArea()
            Image(images[index])
                .onAppear {
                                // Start a timer to change the image every 2 seconds
                                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                    // Change the image
                                    self.index = (self.index + 1) % images.count
                                    self.timerCount += 1
                                    if self.timerCount >= self.maxTimerCount {
                                                    timer.invalidate()
                                        isTimerRunning = false// Stop the timer
                                                }
                                }
                                
                            }
            
        }
        
        
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

