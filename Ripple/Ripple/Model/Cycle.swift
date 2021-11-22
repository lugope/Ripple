//
//  Cycle.swift
//  Ripple
//
//  Created by Dario Galiani on 22/11/21.
//

import Foundation


struct Cycle: Identifiable {
    var id = UUID()
    var inhale:Int
    var midPause:Int
    var exhale:Int
    var endPause:Int
    var repetitions:Int
}

