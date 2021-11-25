//
//  RhythmView.swift
//  Ripple
//
//  Created by Lucas Pereira on 17/11/21.
//

import Foundation
import AVFoundation
import SwiftUI

enum RhythmStage: Int {
    case In, InPause, Out, OutPause
}

//Audio player
var player: AVAudioPlayer?

func playSound() {
    guard let path = Bundle.main.path(forResource: "Bell", ofType:"mp3") else {return}
    let url = URL(fileURLWithPath: path)
    
    do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
    } catch {
        print("// couldn't load file :(")
    }
}

struct RhythmView: View {
    @EnvironmentObject var currentExercise: CurrentExercise
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //Rhythm configuration
    // TODO: adapt the code to read the definer Rhythm Model
    let rhythmConfig: [Double] = [4.0, 4.0, 4.0, 4.0, 0.0]
    let message: [String] = ["In", "Pause", "Out", "Pause", "Be ready"]
    
    // Animation states
    @State private var animationScaleCircle1 = 1.0
    @State private var animationScaleCircle2 = 1.0
    @State private var animationScaleCircle3 = 1.0
    @State private var animationColor = Color.white
    
    //Timer
    @State var secCounting: Double = 5
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
                    .foregroundColor(StandartColor.listBackgroundColor.color)
                    .font(.system(size: 20).bold())
                    .padding(.top, 12)
                Text("\(message[currentStage])")
                    .foregroundColor(StandartColor.listBackgroundColor.color)
                    .font(.system(size: 42).bold())
                    .padding(.top, 36)
                
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
                    Text(String(format: "%g", secCounting))
                        .foregroundColor(StandartColor.timerColor.color)
                        .font(.system(size: 30).bold())
                        .onReceive(timer) { _ in
                            secCounting -= 1
                            
                            
                            if shouldRhythmAnimRun {
                                if (secCounting <= 0) || isFirstAnimation {
                                    //Play sound
                                    playSound()
                                    
                                    // Define de stage of the animation
                                    // and the duration for the current state
                                    if isFirstAnimation {
                                        stageCount = 0
                                        isFirstAnimation = false
                                    } else {
                                        stageCount += 1
                                    }
                                    currentStage = stageCount % 4
                                    
                                    secCounting = rhythmConfig[currentStage]
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
                                if secCounting <= 0 {
                                    shouldRhythmAnimRun = true
                                }
                            }
                        }
                    
                    // Boarder Lines
                    Circle().strokeBorder(Color.white, lineWidth: 1)
                        .frame(width: 320, height: 320, alignment: .center)
                    Circle().strokeBorder(Color.white, lineWidth: 1)
                        .frame(width:123.45, height: 123.45, alignment: .center)
                }.padding()
                
                //Back button
                ZStack {
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 4)
                        .frame(width: 123.45, height: 123.45, alignment: .center)
                        .foregroundColor(.clear)
                    
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                        Text("STOP").background(Color.white)
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(StandartColor.interactiveTextColor.color)
                            .background(Color.white)
                            .clipShape(Circle())
                            .font(.system(size: 30).bold())
                    }
                }.padding(.bottom, 50)
                
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

