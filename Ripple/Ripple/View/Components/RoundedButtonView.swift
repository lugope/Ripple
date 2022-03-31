//
//  RoundedButtonView.swift
//  Ripple
//
//  Created by Lucas Pereira on 29/03/22.
//

import Foundation
import SwiftUI

struct RoundedButtonView: View {
    let diameter: CGFloat
    let text: String
    let textScaleFactor: CGFloat = 0.2
    private var lineWidth: CGFloat { return diameter/29.0301 }
    
    var body: some View {
        ZStack {
            Circle().strokeBorder(Color.white, lineWidth: lineWidth )
                .foregroundColor(Color.clear)
                .frame(
                    width: diameter,
                    height: diameter,
                    alignment: .center
                )
            
            Text(text)
                .frame(
                    width: diameter - lineWidth*4,
                    height: diameter - lineWidth*4,
                    alignment: .center
                )
                .foregroundColor(StandartColor.interactiveTextColor.color)
                .background(Color.white)
                .clipShape(Circle())
                .font(
                    .system(size: diameter * textScaleFactor).bold()
                )
        }
    }
}
