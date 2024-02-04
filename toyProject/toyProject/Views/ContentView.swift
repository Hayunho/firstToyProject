//
//  ContentView.swift
//  toyProject
//
//  Created by 하윤호 on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    Text("미니게임")
                        .font(.system(size: 72))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
                
                VStack{
                    NavigationLink(destination: RockScissorsPaperView()) {
                        ZStack {
                            Rectangle()
                                .fill(Color("MainColor"))
                                .modifier(MiniGameButtonStyle())
                            Text("가위바위보")
                                .modifier(MiniGameButtonTitle())
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color("MainColor"))
                                .modifier(MiniGameButtonStyle())
                            Text("비밀번호")
                                .modifier(MiniGameButtonTitle())
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
    }
}

struct MiniGameButtonStyle: ViewModifier {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.80, height:screenHeight * 0.07)
            .cornerRadius(30.0)
    }
}

struct MiniGameButtonTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .fontWeight(.medium)
            .font(.system(size: 40))
    }
}

#Preview {
    ContentView()
}
