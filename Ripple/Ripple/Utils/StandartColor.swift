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
    case circleButtonContent
    case interactiveTextColor
    case listTitleColor
    case listDetailColor
    case listBackgroundColor
    case contrastRed
    case timerColor
    
    var color: Color {
        switch self {
        case .backgroundBlue:
            return Color(hex: "387FB7")
        case .buttonWhite:
            return Color.white
        case .circleButtonContent:
            return Color(hex: "01579B")
        case .interactiveTextColor:
            return Color(hex: "235696")
        case .listTitleColor:
            return Color(hex: "007AFF", opacity: 0.6)
        case .listDetailColor:
            return Color(hex: "A6B5DF")
        case .listBackgroundColor:
            return Color(hex: "eceef4")
        case .contrastRed:
            return Color(hex: "B84E4B")
        case .timerColor:
            return Color(hex: "000000", opacity: 0.9)
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
