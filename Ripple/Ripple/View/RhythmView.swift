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
    let rhythmConfig: [Double] = [4.0, 2.0, 4.0, 2.0, 0.0]
    let message: [String] = ["In", "Pause (In)", "Out", "Pause (Out)", "Be ready"]
    
    // Animation states
    @State private var animationScaleCircle1 = 1.0
    @State private var animationScaleCircle2 = 1.0
    @State private var animationScaleCircle3 = 1.0
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
    @State private var delayCircle1: Double = 0
    @State private var delayCircle2: Double = 1
    @State private var delayCircle3: Double = 2
    
    var body: some View {
        ZStack{
            StandartColor.backgroundBlue.color.ignoresSafeArea()
            
            VStack{
                Text("\(currentExercise.exercise.name)")
                Text("\(message[currentStage])")
                
                //Rhythm animation
                ZStack{
                    StandartColor.backgroundBlue.color.ignoresSafeArea()
                    //Animation elements
                    Circle() //1
                        .foregroundColor(Color.white)
                        .frame(width: 123.45, height: 123.45, alignment: .center)
                        .colorMultiply(animationColor)
                        .scaleEffect(animationScaleCircle1)
                        .animation(
                            .easeInOut(duration: animationDuration - delayCircle1).delay(delayCircle1),
                            value: animationScaleCircle1
                        )
                        .animation(
                            .easeIn(duration: 0.3),
                            value: animationColor
                        )
                    
                    Circle() //2
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                        .frame(width: 61.72, height: 61.72, alignment: .center)
                        .scaleEffect(animationScaleCircle2)
                        .animation(
                            .easeInOut(duration: animationDuration - delayCircle2).delay(delayCircle2),
                            value: animationScaleCircle2
                        )
                    
                    Circle() //3
                        .foregroundColor(Color.white)
                        .opacity(0.5)
                        .frame(width: 30.86, height: 30.86, alignment: .center)
                        .scaleEffect(animationScaleCircle3)
                        .animation(
                            .easeInOut(duration: animationDuration - delayCircle3).delay(delayCircle3),
                            value: animationScaleCircle3
                        )
                    
                    //Animation mechanics
                    Text(String(format: "%g", secCounting)).onReceive(timer) { _ in
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
                                    animationScaleCircle1 = 2.59
                                    animationScaleCircle2 = 4.7
                                    animationScaleCircle3 = 7.5
                                    
                                    delayCircle1 = 0
                                    delayCircle2 = 0.5
                                    delayCircle3 = 1
                                    
                                case RhythmStage.InPause.rawValue:
                                    animationColor = StandartColor.listDetailColor.color
                                    
                                case RhythmStage.Out.rawValue:
                                    animationColor = StandartColor.contrastRed.color
                                    animationScaleCircle1 = 1
                                    animationScaleCircle2 = 1
                                    animationScaleCircle3 = 1
                                    
                                    delayCircle1 = 1
                                    delayCircle2 = 0.5
                                    delayCircle3 = 0
                                    
                                case RhythmStage.OutPause.rawValue:
                                    animationColor = StandartColor.listDetailColor.color
                                    
                                default:
                                    animationColor = Color.black
                                }
                            }
                            
                        } else {
                            if secCounting >= 1 {
                                shouldRhythmAnimRun = true
                            }
                        }
                    }
                    
                    // Boarder Lines
                    Circle().strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 320, height: 320, alignment: .center)
                    Circle().strokeBorder(Color.white, lineWidth: 1)
                        .frame(width:123.45, height: 123.45, alignment: .center)
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

