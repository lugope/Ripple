//
//  RippleApp.swift
//  Ripple
//
//  Created by Lucas Pereira on 15/11/21.
//

import SwiftUI

@main
struct RippleApp: App {
    @StateObject var currentExercise = CurrentExercise(
        exercise: Excercise(name: "Exercise Place Holder",
                            cycles: [Cycle(inhale: 1, midPause: 1, exhale: 1, endPause: 1, repetitions: 1)]),
        sound: Sound(name: "Sound Place Holder")
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(currentExercise)
        }
    }
}
