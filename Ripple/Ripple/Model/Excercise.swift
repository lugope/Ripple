//
//  Excercise.swift
//  Ripple
//
//  Created by Dario Galiani on 22/11/21.
//

import Foundation

struct Excercise: Identifiable {
    var id = UUID()
    var name:String
    var cycles:[Cycle]
}
