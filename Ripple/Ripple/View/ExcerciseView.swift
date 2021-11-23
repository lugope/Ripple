//
//  ExcerciseView.swift
//  Ripple
//
//  Created by Dario Galiani on 19/11/21.
//

import SwiftUI
import Foundation

struct CycleTest: Identifiable {
    
    init(){
        id = UUID()
        name = "Cycle"
        inhale = 0
        exhale = 0
        midPause = 0
        endPause = 0
        repetitions = 1
    }
    
    var id:UUID
    var name:String
    var inhale:Int
    var midPause:Int
    var exhale:Int
    var endPause:Int
    var repetitions:Int
}

let cycles:[CycleTest] = [
    CycleTest(),
    CycleTest(),
    CycleTest(),
    CycleTest(),
    CycleTest(),
    CycleTest()
]

struct ClearButton: ViewModifier {
    @Binding var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
            // onTapGesture is better than a Button here when adding to a form
            Image(systemName: "multiply.circle.fill")
                .foregroundColor(.secondary)
                .opacity(text == "" ? 0 : 1)
                .onTapGesture { self.text = "" }
        }
    }
}

private struct RowContent: View {
    var cycle: CycleTest
    
    var body: some View {
        
        NavigationLink(destination: ExcerciseView()) {
            Text(cycle.name)
        }
            .listRowBackground(Color(red: 251/255, green: 251/255, blue: 253/255, opacity: 100))
            .foregroundColor(Color(red: 35/255, green: 86/255, blue: 150/255, opacity: 100))
    }
    
}

struct ExcerciseView: View {
    
    @State var excerciseName:String = ""
    
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
    
        NavigationView{
            
            VStack(alignment: .leading, spacing: 0){
                
                List{
                    Section(header: Text("Excercise Name")){
                        TextField("Excercise Name", text: $excerciseName)
                            .modifier(ClearButton(text: $excerciseName))
                        
                    }
                }.listStyle(InsetGroupedListStyle())
                    .frame(height: 100)
                
                List{
                    Section(
                        header:
                            HStack{
                                Text("Cycles")
                                Spacer()
                                Button(action: {print("Ciao")}){
                                    Image(systemName: "plus")
                                }
                            }
                    ){
                        ForEach(cycles, id: \.id) { c in
                            NavigationLink(c.name, destination: ExcercisesListView())
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
                
            }
            
        }
    }
}
                
struct ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseView()
    }
}
