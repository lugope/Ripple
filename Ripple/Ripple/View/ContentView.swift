//
//  ContentView.swift
//  Ripple
//
//  Created by Lucas Pereira on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack{
                StandartColor.backgroundBlue.color
                    .ignoresSafeArea()
                
                VStack{
                    ZStack{
                        NavigationLink(
                            destination: RhythmView(rhythm: RhythymModel(color: Color.red)),
                            tag: 1,
                            selection: $selection
                        ) {
                            Button(action: {self.selection = 1}) {
                                Text("START")
                                    .foregroundColor(Color.blue)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .font(.system(size: 40).bold())
                            }
                        }
                        
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 5)
                            .frame(width: 220, height: 220, alignment: .center)
                            .foregroundColor(.clear)
                    }
                    
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