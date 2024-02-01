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
    private let cardNumbers: [Int] = [
        1, 2, 3, 4
    ]
    
    @State private var seletedNumberCard: Int = 0
    
    var secretNumber: SecretNumberModel = SecretNumberModel()
    
    var body: some View {
        VStack{
            HStack {
                ForEach(cardNumbers, id: \.self) { cardNumber in
                    Button {
                        seletedNumberCard = cardNumber
                    } label: {
                        if seletedNumberCard == cardNumber {
                            ZStack {
                                Rectangle ()
                                    .fill(Color("ReverseColor"))
                                    .modifier(NumberButtonStyle())
                                Text("?")
                                    .modifier(NumberButtonTitle())
                            }
                        } else {
                            ZStack {
                                Rectangle ()
                                    .fill(Color("MainColor"))
                                    .modifier(NumberButtonStyle())
                                Text("?")
                                    .modifier(NumberButtonTitle())
                            }
                        }
                    }
                }
            }
            VStack(spacing: 6) {
                HStack(spacing: 6) {
                    ForEach(firstNumbers, id: \.self) { number in
                        Button{
                            if secretNumber.firstNumber == number {
                                print("O")
                            } else {
                                print("X")
                            }
                        } label: {
                            ZStack {
                                Rectangle ()
                                    .fill(Color("MainColor"))
                                    .modifier(NumberButtonStyle())
                                Text("\(number)")
                                    .modifier(NumberButtonTitle())
                            }
                        }
                        
                    }
                    
                }
                
                HStack(spacing: 6){
                    ForEach(secondNumbers, id: \.self) { number in
                        Button{
                            if secretNumber.firstNumber == number {
                                print("O")
                            } else {
                                print("X")
                            }
                        } label: {
                            ZStack {
                                Rectangle ()
                                    .fill(Color("MainColor"))
                                    .modifier(NumberButtonStyle())
                                Text("\(number)")
                                    .modifier(NumberButtonTitle())
                            }
                        }
                        
                    }
                    
                }
            }
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


#Preview {
    SecretNumberView()
}
