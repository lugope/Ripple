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
                Color.blue
                    .opacity(0.5)
                    .ignoresSafeArea()
                
                VStack{
                    NavigationLink(
                        destination: RhythmView(rhythm: RhythymModel(color: Color.red)),
                        tag: 1,
                        selection: $selection
                    ) {
                        Button(action: {self.selection = 1}) {
                            Text("START")
                                .frame(width: 200, height: 200, alignment: .center)
                                .font(.system(size: 40).bold())

                        }
                        .buttonStyle(CicleButtonStyle())
                        
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
