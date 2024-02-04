//
//  SecretNumberModel.swift
//  toyProject
//
//  Created by 하윤호 on 1/31/24.
//

import Foundation
//
//enum SecretNumber: Int, CaseIterable {
//    case firstNumber = Int.random(in: 0...9)
//    case secondNumber = Int.random(in: 0...9)
//    case thirdNumber = Int.random(in: 0...9)
//    case forthNumber = Int.random(in: 0...9)
//}

struct SecretNumberModel {
    var firstNumber: Int
    var secondNumber: Int
    var thirdNumber: Int
    var forthNumber: Int
    
    init() {
        self.firstNumber = Int.random(in: 0...9)
        self.secondNumber = Int.random(in: 0...9)
        self.thirdNumber = Int.random(in: 0...9)
        self.forthNumber = Int.random(in: 0...9)
    }
    
    func compareNumber(seleted: Int, number: Int) -> String {
        var result: String = ""
        
        switch(seleted) {
        case 1:
            if number == firstNumber {
                result = "GOOD"
            } else if number < firstNumber {
                result = "UP"
            } else {
                result = "DOWN"
            }
        case 2:
            if number == secondNumber {
                result = "GOOD"
            } else if number < secondNumber {
                result = "UP"
            } else {
                result = "DOWN"
            }
        case 3:
            if number == thirdNumber {
                result = "GOOD"
            } else if number < thirdNumber {
                result = "UP"
            } else {
                result = "DOWN"
            }
        case 4:
            if number == forthNumber {
                result = "GOOD"
            } else if number < forthNumber {
                result = "UP"
            } else {
                result = "DOWN"
            }
        default:
            break
        }
        
        return result
    }
}
