//
//  RhythmView.swift
//  Ripple
//
//  Created by Lucas Pereira on 17/11/21.
//

import Foundation
import SwiftUI

enum RhythmStage: Int {
    case In, InPause, Out, OutPause
}

struct RhythmView: View {
    @EnvironmentObject var currentExercise: CurrentExercise
    
    //Rhythm configuration
    // TODO: adapt the code to read the definer Rhythm Model
    let rhythmConfig: [Double] = [5.0, 4.0, 3.0, 2.0, 0.0]
    let message: [String] = ["In", "Pause (In)", "Out", "Pause (Out)", "Be ready"]
    
    // Animation states
    @State private var animationSize = 1.0
    @State private var animationColor = Color.white
    //Timer
    @State var secCounting: Double = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //Control var
    @State private var stageCount: Int = 0
    @State private var currentStage: Int = 4
    @State private var animationDuration: Double = 0
    @State private var shouldRhythmAnimRun: Bool = false
    @State private var isFirstAnimation: Bool = true
    
    var body: some View {
        ZStack{
            StandartColor.backgroundBlue.color.ignoresSafeArea()
            
            VStack{
                Text("\(currentExercise.exercise.name)")
                Text("\(message[currentStage])")
                
                //Rhythm animation
                ZStack{
                    StandartColor.backgroundBlue.color.ignoresSafeArea()
                    //Rhythm animation
                    Circle()
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 200, alignment: .center)
                        .colorMultiply(animationColor)
                        .scaleEffect(animationSize)
                        .animation(.easeInOut(duration: animationDuration), value: animationSize)
                        .animation(
                            .easeIn(duration: 1) ,value: animationColor
                        )
                    
                    Text("\(secCounting)").onReceive(timer) { _ in
                        secCounting += 1
                        
                        if shouldRhythmAnimRun {
                            if (secCounting >= rhythmConfig[currentStage]) || isFirstAnimation {
                                secCounting = 0
                                
                                // Define de stage of the animation
                                // and the duration for the current state
                                if isFirstAnimation {
                                    stageCount = 0
                                    isFirstAnimation = false
                                } else {
                                    stageCount += 1
                                }
                                currentStage = stageCount % 4
                                animationDuration = rhythmConfig[currentStage]
                                
                                // Set new values to animate
                                switch currentStage {
                                case RhythmStage.In.rawValue:
                                    animationColor = Color.blue
                                    animationSize = 1.61
                                    
                                case RhythmStage.InPause.rawValue:
                                    animationColor = Color.gray
                                    
                                case RhythmStage.Out.rawValue:
                                    animationColor = Color.red
                                    animationSize = 0.5
                                    
                                case RhythmStage.OutPause.rawValue:
                                    animationColor = Color.gray
                                    
                                default:
                                    animationColor = Color.black
                                }
                            }
                            
                        } else {
                            if secCounting >= 5 {
                                shouldRhythmAnimRun = true
                            }
                        }
                    }
                    
                    // Boarder Lines
                    Circle().strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 300, height: 300, alignment: .center)
                    Circle().strokeBorder(Color.white, lineWidth: 1)
                        .frame(width:100, height: 100, alignment: .center)
                }
                
                Spacer()
            }.navigationBarHidden(true)
        }
    }
}

struct RhythmView_Previews: PreviewProvider {
    static var previews: some View {
        RhythmView()
    }
}

