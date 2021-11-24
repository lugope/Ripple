//
//  CycleView.swift
//  Ripple
//
//  Created by Dario Galiani on 22/11/21.
//

import SwiftUI

let breathPhases:[String] = ["Inhale", "Inhale Pause", "Exhale", "Exhale Pause"]

struct CyclePropertyList:View {
    let cycle:CycleTest

    var body: some View {
        
        List{
            Section(header:
                Text("Cycle Property")
            ){
                CyclePropertyItemRow(label: breathPhases[0], time: cycle.inhale)
                CyclePropertyItemRow(label: breathPhases[1], time: cycle.midPause)
                CyclePropertyItemRow(label: breathPhases[2], time: cycle.exhale)
                CyclePropertyItemRow(label: breathPhases[3], time: cycle.endPause)
            }
        }
        .frame(height: 240)
    }
    
}

struct CyclePropertyItemRow: View {
    let label:String
    @State var time:Int
    @State private var cycleNumber = 1
    
    var body: some View {
        
        HStack{
            Text("\(label)")
            Spacer()
            Text("\(time)s")
            Stepper("", value: $time, in: 0...60).frame(width:100)
        }
        
    }
}

struct RepetitionsNumberRow: View {
    @State private var repetitionNumber = 0
    
    var body: some View{
        HStack{
            Text("Repetitions Number")
            Spacer()
            Text("\(repetitionNumber)")
            Stepper("", value: $repetitionNumber, in: 0...60).frame(width:100)
        }
    }
}

struct CycleView: View {
    
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
        
        VStack(alignment: .leading, spacing: 0){
            
            CyclePropertyList(cycle: cycles[0])
            
            List{
                Section(header:
                            Text("Cycle Repetitions")
                    ){
                    HStack{
                        RepetitionsNumberRow()
                        }
                    }
            }
        }

    }
        
    
}

struct CycleView_Previews: PreviewProvider {
    static var previews: some View {
        CycleView()
    }
}
