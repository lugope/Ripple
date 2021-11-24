//
//  CurrentExercise.swift
//  Ripple
//
//  Created by Lucas Pereira on 24/11/21.
//

import Foundation

class CurrentExercise: ObservableObject {
    @Published var exercise: Excercise
    @Published var sound: Sound
    
    internal init(exercise: Excercise, sound: Sound) {
        self.exercise = exercise
        self.sound = sound
    }
}
