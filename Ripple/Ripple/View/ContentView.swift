//
//  ContentView.swift
//  Ripple
//
//  Created by Lucas Pereira on 15/11/21.
//

import SwiftUI


struct ContentView: View {
    @State var selection: Int? = nil
    @EnvironmentObject var currentExercise: CurrentExercise
    
    let nameButtonExercise = ["Exercise"]
    let nameButtonSound = ["Sound"]
    let startButtonSize: CGFloat = 250
    
    var body: some View {
        NavigationView {
            ZStack{
                StandartColor.backgroundBlue.color
                    .ignoresSafeArea()
                
                VStack(){
                    // Start Button
                    ZStack{
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 8)
                            .frame(width: startButtonSize+30, height: startButtonSize+30, alignment: .center)
                            .foregroundColor(.clear)
                        
                        NavigationLink(
                            destination: RhythmView().environmentObject(currentExercise),
                            tag: 1,
                            selection: $selection
                        ) {
                            Button(action: {self.selection = 1}) {
                                Text("START")
                                    .frame(width: startButtonSize, height: startButtonSize, alignment: .center)
                                    .foregroundColor(StandartColor.interactiveTextColor.color)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .font(.system(size: 48).bold())
                            }
                        }
                    }
                    .padding(.bottom, 120)
                    .padding(.top, 200)
                    
                    // Exercise Button
                    NavigationLink(
                        destination: ExcercisesListView(),
                        tag: 2,
                        selection: $selection
                    ) {
                        Button(action: {self.selection = 2}) {
                            Text("Exercises").foregroundColor(StandartColor.interactiveTextColor.color).padding()
                            Spacer()
                            Text(currentExercise.exercise.name).foregroundColor(StandartColor.listDetailColor.color)
                            Image(uiImage: UIImage(named: "ArrowRight")!).padding(.trailing)
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.leading)
                        .padding(.trailing)
                    }.navigationBarHidden(true)
                    
                    //TODO: Sound Button
                    NavigationLink(
                        destination: SoundListView().environmentObject(currentExercise),
                        tag: 3,
                        selection: $selection
                    ) {
                        Button(action: {self.selection = 3}) {
                            Text("Sound").foregroundColor(StandartColor.interactiveTextColor.color).padding()
                            Spacer()
                            Text(currentExercise.sound.name).foregroundColor(StandartColor.listDetailColor.color)
                            Image(uiImage: UIImage(named: "ArrowRight")!).padding(.trailing)
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding(.leading)
                        .padding(.trailing)}
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
