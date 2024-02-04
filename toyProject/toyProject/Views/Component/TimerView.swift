//
//  TimerView.swift
//  toyProject
//
//  Created by 하윤호 on 1/31/24.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

struct TimerView: View {
    
    @StateObject var myTimer = MyTimer()
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color("SubColor"))
                    .cornerRadius(50)
                    .frame(width: screenWidth * 0.9, height: 40)
                
                Rectangle()
                    .fill(Color("MainColor"))
                    .cornerRadius(50)
                    .frame(width: screenWidth * 0.1 + CGFloat(Int(screenWidth * 0.8) / limitTimer * self.myTimer.value), height: 40)
            }
        }
    }
}

#Preview {
    TimerView()
}
