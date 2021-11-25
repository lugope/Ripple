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
    var image:Image
}

let excercisesName:[ExcerciseTest] = [
    ExcerciseTest(name:"Savasana", image: Image(systemName: "checkmark")),
    ExcerciseTest(name:"Crunch", image: Image("")),
    ExcerciseTest(name:"Run", image: Image("")),
    ExcerciseTest(name:"Squat", image: Image("")),
    ExcerciseTest(name:"Trikonasana", image: Image(""))
]



private struct RowContent: View {
    var excercise: ExcerciseTest
    
    var body: some View {
        HStack{
            Text(excercise.name).foregroundColor(StandartColor.interactiveTextColor.color)
            Spacer()
            excercise.image.foregroundColor(Color.blue)
        }
    }
    
}

struct ExcercisesListView: View {
    @State var selectionNav: Int? = nil
    
    init() {
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = UIColor(Color(red: 236/255, green: 238/255, blue: 244/255, opacity: 100))
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color(red: 94/255, green: 168/255, blue: 251/255, opacity: 100))]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
        
        UITableView.appearance().backgroundColor = UIColor(StandartColor.listBackgroundColor.color)
    }
    
    var body: some View {
        List {
            Section(
                header:
                    HStack{
                        Text("Your excercise")
                            .foregroundColor(Color(red: 94/255, green: 168/255, blue: 251/255, opacity: 100))
                        Spacer()
                        
                        NavigationLink(
                            destination: ExcerciseView(),
                            tag: 1,
                            selection: $selectionNav
                        ) {
                            Button(action: {selectionNav = 1}){
                                Image(systemName: "plus")
                                
                            }
                            .foregroundColor(Color(red: 35/255, green: 86/255, blue: 150/255, opacity: 100))
                        }
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

struct ExcercisesList_Previews: PreviewProvider {
    static var previews: some View {
        ExcercisesListView()
    }
}
