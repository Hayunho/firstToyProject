//
//  RockScissorsPaperView.swift
//  toyProject
//
//  Created by 하윤호 on 1/31/24.
//

import SwiftUI

struct RockScissorsPaperView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(height: 10)
                
                TimerView()
                
                RSPView()
            }
        }
        .navigationTitle("가위바위보")
    }
}

struct RSPView: View {
    @ObservedObject var myTimer = MyTimer()
    @State var computerRSP: RockScissorsPaper = [.rock, .scissors, .paper].randomElement()!
    @State var score: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("\(score)")
                        .font(.system(size: 100))
                        .fontWeight(.semibold)
                    
                    Text("Score")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                }
                
                Spacer()
                    .frame(height: 30)
                
                RockScissorsPaperComponent(rsp: computerRSP, isUserButton: false)
                
                Spacer()
                    .frame(height: 70)
                
                HStack {
                    Button {
                        switch computerRSP {
                        case .rock:
                            score = score
                        case .scissors:
                            score += 1
                        case .paper:
                            score -= 1
                        }
                        
                        computerRSP = [.rock, .scissors, .paper].randomElement()!
                    } label : {
                        RockScissorsPaperComponent(rsp: .rock, isUserButton: true)
                    }
                    .disabled(myTimer.value < 10 ? false : true)
                    
                    
                    Button {
                        switch computerRSP {
                        case .rock:
                            score -= 1
                        case .scissors:
                            score = score
                        case .paper:
                            score += 1
                        }
                        computerRSP = [.rock, .scissors, .paper].randomElement()!
                    } label : {
                        RockScissorsPaperComponent(rsp: .scissors, isUserButton: true)
                    }
                    .disabled(myTimer.value < 10 ? false : true)
                    
                    Button {
                        switch computerRSP {
                        case .rock:
                            score += 1
                        case .scissors:
                            score -= 1
                        case .paper:
                            score = score
                        }
                        computerRSP = [.rock, .scissors, .paper].randomElement()!
                    } label : {
                        RockScissorsPaperComponent(rsp: .paper, isUserButton: true)
                    }
                    .disabled(myTimer.value < 10 ? false : true)
                }
            }
            
            if myTimer.value >= 10 {
                Text("Game Over")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 80))
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.red)
            }
        }
    }
}

#Preview {
    RockScissorsPaperView()
}
