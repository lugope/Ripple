//
//  ExcercisesList.swift
//  Ripple
//
//  Created by Dario Galiani on 19/11/21.
//

import Foundation
import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct ExcerciseTest: Identifiable {
    var id = UUID()
    var name:String
}

let excercisesName:[ExcerciseTest] = [
    ExcerciseTest(name:"Squat"),
    ExcerciseTest(name:"Crunch"),
    ExcerciseTest(name:"Run"),
    ExcerciseTest(name:"Savasana"),
    ExcerciseTest(name:"Trikonasana"),
    ExcerciseTest(name:"Mammt"),
    ExcerciseTest(name:"Afancul"),
]

private struct RowContent: View {
    var excercise: ExcerciseTest
    
    var body: some View {
        NavigationLink(destination: ExcerciseView()) {
            Text(excercise.name)
        }
        .listRowBackground(Color(red: 251/255, green: 251/255, blue: 253/255, opacity: 100))
        .foregroundColor(StandartColor.interactiveTextColor.color)
    }
    
}

struct ExcercisesListView: View {
    
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

            NavigationView {
                
                    List {
                        Section(
                            header:
                                HStack{
                                    Text("Your excercise")
                                        .foregroundColor(Color(red: 94/255, green: 168/255, blue: 251/255, opacity: 100))
                                    Spacer()
                                    Button(action: {print("Ciao")}){
                                        Image(systemName: "plus")
                                    }
                                        .foregroundColor(Color(red: 35/255, green: 86/255, blue: 150/255, opacity: 100))
                                }
                        ) {
                            ForEach( excercisesName, id:\.id) { e in
                                RowContent(excercise: e)
                            }
                        } // End Section
                    } // End List
                        .navigationTitle("Excercises")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItemGroup(placement: .navigationBarTrailing){
                                Button("Edit") {
                                    print("Pressed")
                                }
                                    .foregroundColor(Color(red: 35/255, green: 86/255, blue: 150/255, opacity: 100))
                            }
                        }
                
            }
        
    }
    
}

struct ExcercisesList_Previews: PreviewProvider {
    static var previews: some View {
        ExcercisesListView()
    }
}
