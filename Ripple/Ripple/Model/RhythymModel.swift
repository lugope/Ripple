//
//  RhythymModel.swift
//  Ripple
//
//  Created by Lucas Pereira on 17/11/21.
//

import Foundation
import SwiftUI

struct RhythymModel: Identifiable {
    var id = UUID()
    var color: Color
    var description: String {
        color.description.capitalized
    }
}
