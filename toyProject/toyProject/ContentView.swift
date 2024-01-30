//
//  ContentView.swift
//  toyProject
//
//  Created by 하윤호 on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("미니게임")
                .font(.system(size: 72))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Spacer()
            Spacer()
            
            Button {
                
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(width: screenWidth * 0.80, height:screenHeight * 0.07)
                        .cornerRadius(30.0)
                    Text("가위바위보")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .font(.system(size: 40))
                }
            }
            
            Button {
                
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color("MainColor"))
                        .frame(width: screenWidth * 0.80, height:screenHeight * 0.07)
                        .cornerRadius(30.0)
                    Text("비밀번호")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .font(.system(size: 40))
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
