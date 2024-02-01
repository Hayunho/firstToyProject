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
    @State private var result: String = ""
    
    var secretNumber: SecretNumberModel = SecretNumberModel()
    
    var body: some View {
        VStack() {
            TimerView()
            Spacer()
            Spacer()
            HStack {
                ForEach(cardNumbers, id: \.self) { cardNumber in
                    Button {
                        seletedNumberCard = cardNumber
                    } label: {
                        if seletedNumberCard == cardNumber {
                            ZStack {
                                Rectangle ()
                                    .fill(Color("ReverseSubColor"))
                                    .modifier(NumberCardStyle())
                                Text("?")
                                    .modifier(NumberCardTitle(isSeleted: true))
                            }
                        } else {
                            ZStack {
                                Rectangle ()
                                    .fill(Color("SubColor"))
                                    .modifier(NumberCardStyle())
                                Text("?")
                                    .modifier(NumberCardTitle(isSeleted: false))
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
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
                            result = compareNumber(seleted: seletedNumberCard, number: number, cardNumber:3)
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
            Spacer()
        }
        .navigationTitle("비밀번호 맞추기")
    }
}


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
    var isSeleted: Bool = false
    
    init(isSeleted: Bool) {
        self.isSeleted = isSeleted
    }
    
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


func compareNumber(seleted: Int, number: Int, cardNumber: Int) -> String{
    var result: String = ""
    
    switch(seleted) {
    case 1:
        if number == cardNumber {
            result = "GOOD"
        } else if number < cardNumber {
            result = "UP"
        } else {
            result = "DOWN"
        }
    case 2:
        if number == cardNumber {
            result = "GOOD"
        } else if number < cardNumber {
            result = "UP"
        } else {
            result = "DOWN"
        }
    case 3:
        if number == cardNumber {
            result = "GOOD"
        } else if number < cardNumber {
            result = "UP"
        } else {
            result = "DOWN"
        }
    case 4:
        if number == cardNumber {
            result = "GOOD"
        } else if number < cardNumber {
            result = "UP"
        } else {
            result = "DOWN"
        }
    default:
        break
    }
    
    return result
}

#Preview {
    NavigationStack {
        SecretNumberView()
    }
}
