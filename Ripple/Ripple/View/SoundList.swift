//
//  SoundList.swift
//  Ripple
//
//  Created by Antonio Giulio Mele on 22/11/21.
//

import Foundation
import SwiftUI


struct SoundTest: Identifiable {
    var id = UUID()
    var name:String
    var image:Image
}

let soundName:[SoundTest] = [
    SoundTest(name:"Bell", image: Image(systemName: "checkmark")),
    SoundTest(name:"Waves", image: Image("")),
    SoundTest(name:"Wind", image: Image(""))
]

private struct RowContent: View {
    var sound: SoundTest
    
    var body: some View {
        HStack{
            Text(sound.name).foregroundColor(StandartColor.interactiveTextColor.color)
            Spacer()
            sound.image.foregroundColor(Color.blue)
        }
    }
    
}

struct SoundListView: View {
    @EnvironmentObject var currentExercise: CurrentExercise
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(Color(red: 236/255, green: 238/255, blue: 244/255, opacity: 100))
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color(red: 94/255, green: 168/255, blue: 251/255, opacity: 100))]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
        UITableView.appearance().backgroundColor = UIColor(Color(red: 236/255, green: 238/255, blue: 244/255, opacity: 100))
    }
    
    var body: some View {
        List {
            Section(
                header:

                        Text("Your Sounds")
                            .foregroundColor(Color(red: 94/255, green: 168/255, blue: 251/255, opacity: 100))
                    
            ) {
                ForEach( soundName, id:\.id) { e in
                    RowContent(sound: e)
                }
            } // End Section
        } // End List
            .navigationTitle("Sounds")
            .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct SoundList_Previews: PreviewProvider {
    static var previews: some View {
        SoundListView()
            .previewDevice("iPhone 11")
    }
}
