//
//  ContentView.swift
//  Ripple
//
//  Created by Lucas Pereira on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    let startButtonSize: CGFloat = 250
    
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack{
                StandartColor.backgroundBlue.color
                    .ignoresSafeArea()
                
                VStack{
                    // Start Button
                    ZStack{
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 8)
                            .frame(width: startButtonSize+30, height: startButtonSize+30, alignment: .center)
                            .foregroundColor(.clear)
                        
                        NavigationLink(
                            destination: RhythmView(),
                            tag: 1,
                            selection: $selection
                        ) {
                            Button(action: {self.selection = 1}) {
                                Text("START")
                                    .frame(width: startButtonSize, height: startButtonSize, alignment: .center)
                                    .foregroundColor(StandartColor.circleButtonContent.color)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .font(.system(size: 48).bold())
                            }
                        }
                    }
                    
                    //Exercise List Button
                    NavigationLink(
                        destination: ExcercisesListView(),
                        tag: 2,
                        selection: $selection
                    ) {
                        Button(action: {self.selection = 2}) {
                            Text("Exercise")
                                .frame(width: 200, height: 50, alignment: .center)
                                .foregroundColor(Color.gray)
                                .background(Color.white)
                        }
                    }

                    //TODO: Sound List Button
                    
                }
            }.navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
