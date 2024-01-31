//
//  SecretNumberModel.swift
//  toyProject
//
//  Created by 하윤호 on 1/31/24.
//

import Foundation

enum Gesture {
    case rock, paper, scissors
}

struct RockPaperScissorsGame {
    var playerChoice: Gesture?
    var computerChoice: Gesture?
}
