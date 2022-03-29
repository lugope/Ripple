//
//  PickerTest.swift
//  Ripple
//
//  Created by Lucas Pereira on 30/11/21.
//

import Foundation
import SwiftUI

struct Test: View {
    private let testArray = ["aaaa", "bbbbb", "cccccc"]
    @State var selection = 0
    
    var body: some View {
        Form {
            Picker(selection: $selection, label: Text("Select")) {
                ForEach(0 ..< testArray.count) {
                    Text(self.testArray[$0])
                }
            }
            .pickerStyle(.inline)
            .accentColor(.green)
            
            
        }.navigationBarTitle("TEST", displayMode: .inline)
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

