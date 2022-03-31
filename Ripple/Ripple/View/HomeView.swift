//
//  HomeView.swift
//  Ripple
//
//  Created by Lucas Pereira on 29/03/22.
//

import SwiftUI

struct HomeView: View {
    let startButtonSize: CGFloat = 250
    
    var body: some View {
        NavigationView {
            ZStack {
                StandartColor.backgroundBlue.color
                    .ignoresSafeArea()
                
                VStack {
                    Button(action: {}){
                        RoundedButtonView(diameter: 300, text: "START")
                    }
                    
                    Button(action: {}){
                        ZStack{
                            Text("Exercise")
                                .foregroundColor(StandartColor.interactiveTextColor.color)
                        }.padding()
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .frame(width: .infinity, height: 100, alignment: .center)
                    .padding()
                    
                    Button(action: {}){
                        ZStack{
                            Text("Sound")
                                .foregroundColor(StandartColor.interactiveTextColor.color)
                        }.padding()
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .frame(width: .infinity, height: 100, alignment: .center)
                    .padding()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
