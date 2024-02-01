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
    
    var body: some View {
        ZStack {
            Circle()
                .fill(isUserButton ? Color("MainColor"):  Color("SubColor"))
                .frame(width: isUserButton ? 115 : 241)
            
            Image("\(rsp.rawValue)")
                .resizable()
                .scaledToFit()
                .frame(width: isUserButton ? 80 : 147)
        }
    }
}

#Preview {
    RockScissorsPaperComponent(rsp: .scissors, isUserButton: false)
}
