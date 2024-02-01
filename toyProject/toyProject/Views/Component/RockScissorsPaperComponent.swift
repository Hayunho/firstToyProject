//
//  RockScissorsPaperComponent.swift
//  toyProject
//
//  Created by 최정인 on 2/1/24.
//

import SwiftUI

struct RockScissorsPaperComponent: View {
    var rsp: RockScissorsPaper
    var isUserButton: Bool
    var imageWidth: [CGFloat]
    
    let rockWidth: [CGFloat] = [68, 142.5]
    let scissorsWidth: [CGFloat] = [92, 183]
    let paperWidth: [CGFloat] = [72, 145]
    
    init(rsp: RockScissorsPaper, isUserButton: Bool) {
        self.rsp = rsp
        self.isUserButton = isUserButton
        
        switch self.rsp {
        case .rock:
            self.imageWidth = rockWidth
            
        case .scissors:
            self.imageWidth = scissorsWidth
            
        case .paper:
            self.imageWidth = paperWidth
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(isUserButton ? Color("MainColor"):  Color("SubColor"))
                .frame(width: isUserButton ? 115 : 241)
            
            Image("\(rsp.rawValue)")
                .resizable()
                .scaledToFit()
                .frame(width: isUserButton ? imageWidth[0] : imageWidth[1])
        }
    }
}

#Preview {
    RockScissorsPaperComponent(rsp: .rock, isUserButton: false)
}
