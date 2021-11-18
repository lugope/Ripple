//
//  CircleButtonStyle.swift
//  Ripple
//
//  Created by Lucas Pereira on 18/11/21.
//

import Foundation
import SwiftUI

struct CicleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.blue)
            .background(Color.white)
            .clipShape(Circle())
    }
}
