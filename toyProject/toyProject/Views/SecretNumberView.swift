//
//  SecretNumberView.swift
//  toyProject
//
//  Created by 하윤호 on 1/31/24.
//

import SwiftUI

struct SecretNumberView: View {
    private let firstNumbers: [Int] = [
        1, 2, 3, 4, 5
    ]
    private let secondNumbers: [Int] = [
        6, 7, 8, 9, 0
    ]
    
    @State private var seletedNumberCard: Int = 0
    @State private var result: String = ""
    
    var secretNumber: SecretNumberModel = SecretNumberModel()
    
    var body: some View {
        VStack() {
            TimerView()
            Spacer()
            Spacer()
            
            HStack (spacing: 30){
                Button {
                    seletedNumberCard = 1
                } label: {
                    NumberCardView(seletedNumberCard: seletedNumberCard, cardNumber: 1, result: result)
                }
                Button {
                    seletedNumberCard = 2
                } label: {
                    NumberCardView(seletedNumberCard: seletedNumberCard, cardNumber: 2, result: result)
                }
                Button {
                    seletedNumberCard = 3
                } label: {
                    NumberCardView(seletedNumberCard: seletedNumberCard, cardNumber: 3, result: result)
                }
                Button {
                    seletedNumberCard = 4
                } label: {
                    NumberCardView(seletedNumberCard: seletedNumberCard, cardNumber: 4, result: result)
                }
            }
            
            Spacer()
            
            VStack(spacing: 6) {
                HStack(spacing: 6) {
                    ForEach(firstNumbers, id: \.self) { number in
                        Button{
                            result = secretNumber.compareNumber(seleted: seletedNumberCard, number: number)
                        } label: {
                            NumberButtonView(number: number)
                        }
                        
                    }
                    
                }
                
                HStack(spacing: 6){
                    ForEach(secondNumbers, id: \.self) { number in
                        Button{
                            result = secretNumber.compareNumber(seleted: seletedNumberCard, number: number)
                        } label: {
                            NumberButtonView(number: number)
                        }
                        
                    }
                    
                }
            }
            Spacer()
        }
        .navigationTitle("비밀번호 맞추기")
    }

}

// MARK: - View Modifier

struct NumberCardStyle: ViewModifier {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.17, height:screenHeight * 0.1)
            .cornerRadius(10.0)
            .shadow(radius: 2, x: 0, y: 4)
    }
}

struct NumberCardTitle: ViewModifier {
    var isSeleted: Bool
    
    func body(content: Content) -> some View {
        if isSeleted {
            content
                .frame(width: screenWidth * 0.1, height:screenHeight * 0.06)
                .background(Color("ReverseColor"))
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.system(size: 50))
                .cornerRadius(8.0)
                .shadow(radius: 2, x: 0, y: 3)
        } else {
            content
                .frame(width: screenWidth * 0.1, height:screenHeight * 0.06)
                .background(Color("MainColor"))
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .font(.system(size: 50))
                .cornerRadius(8.0)
                .shadow(radius: 2, x: 0, y: 3)
        }
    }
}



struct NumberButtonStyle: ViewModifier {
    private let screenWidth = UIScreen.main.bounds.size.width
    private let screenHeight = UIScreen.main.bounds.size.height
    
    func body(content: Content) -> some View {
        content
            .frame(width: screenWidth * 0.17, height:screenHeight * 0.08)
            .cornerRadius(10.0)
            .shadow(radius: 2, x: 0, y: 3)
    }
}

struct NumberButtonTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .fontWeight(.semibold)
            .font(.system(size: 50))
    }
}

// MARK: - View

struct NumberButtonView: View {
    let number: Int
    
    var body: some View {
        ZStack {
            Rectangle ()
                .fill(Color("MainColor"))
                .modifier(NumberButtonStyle())
            Text("\(number)")
                .modifier(NumberButtonTitle())
        }
    }
}

struct NumberCardView: View {
    let seletedNumberCard: Int
    let cardNumber: Int
    let result: String
    
    var body: some View {
        ZStack {
            if seletedNumberCard == cardNumber {
                Rectangle ()
                    .fill(Color("ReverseSubColor"))
                    .modifier(NumberCardStyle())
                VStack {
                    Text("\(result)")
                        .frame(width: screenWidth * 0.17, height:screenHeight * 0.02)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                        .foregroundStyle(Color(.white))
                    Text("?")
                        .modifier(NumberCardTitle(isSeleted: true))
                }
                
            } else {
                Rectangle ()
                    .fill(Color("SubColor"))
                    .modifier(NumberCardStyle())
                VStack {
                    Text("\(result)")
                        .frame(width: screenWidth * 0.17, height:screenHeight * 0.02)
                        .fontWeight(.medium)
                        .font(.system(size: 20))
                        .foregroundStyle(Color(.black))
                    Text("?")
                        .modifier(NumberCardTitle(isSeleted: false))
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        SecretNumberView()
    }
}
