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
}
