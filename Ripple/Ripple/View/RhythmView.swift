//
//  RhythmView.swift
//  Ripple
//
//  Created by Lucas Pereira on 17/11/21.
//

import Foundation
import SwiftUI

struct RhythmView: View {
    var rhythm: RhythymModel
    
    var body: some View {
        ZStack{
            rhythm.color
                .opacity(0.2)
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(rhythm.color)
                .frame(width: 200, height: 200, alignment: .center)
            
            Circle().strokeBorder(Color.white, lineWidth: 1)
                .frame(width: 300, height: 300, alignment: .center)
            Circle().strokeBorder(Color.white, lineWidth: 1)
                .frame(width:100, height: 100, alignment: .center)
        }
    }
}

struct RhythmView_Previews: PreviewProvider {
    static var previews: some View {
        RhythmView(rhythm: RhythymModel(color: .blue))
    }
}
