//
//  MyTimer.swift
//  toyProject
//
//  Created by 최정인 on 1/31/24.
//

import Foundation
import SwiftUI
import Combine

let limitTimer: Int = 10
class MyTimer: ObservableObject {
    @Published var value: Int = 0
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.value < limitTimer {
                self.value += 1
            }
        }
    }
}
