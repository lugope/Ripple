//
//  StandartColor.swift
//  Ripple
//
//  Created by Lucas Pereira on 18/11/21.
//

import Foundation
import SwiftUI

enum StandartColor: CaseIterable {
    case backgroundBlue
    case buttonWhite
    
    var color: Color {
        switch self {
        case .backgroundBlue:
            return Color(hex: "0000ff")
        case .buttonWhite:
            return Color.white
        }
    
    }
}

extension Color {
    init(hex: String, opacity: Double = 1) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r,g,b: UInt64
        (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        
        self.init(
            .sRGB,
            red: Double(r)/255,
            green: Double(g)/255,
            blue: Double(b)/255,
            opacity: opacity
        )
    }
}
