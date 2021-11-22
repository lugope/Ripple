//
//  ExcerciseView.swift
//  Ripple
//
//  Created by Dario Galiani on 19/11/21.
//

import SwiftUI

struct Trail: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var distance: Double
}

struct ExcerciseView: View {
    
    let hikingTrails = [
        Trail(name: "Stanford Dish", location: "Palo Alto", distance: 3.9),
        Trail(name: "Edgewood", location: "Redwood City", distance: 3.2),
        Trail(name: "Mission Peak", location: "Fremont", distance: 7.1),
        Trail(name: "Big Basin", location: "Boulder Creek", distance: 4.3),
        Trail(name: "Alum Rock", location: "Milpitas", distance: 5.7),
    ]
    
    struct TrailRow: View {
        var trail: Trail
        
        var body: some View {
            NavigationLink(destination: ExcercisesListView(), label: {
                HStack {
                    VStack(alignment: .leading) {
                        Text(trail.name)
                        Text(trail.location).font(.subheadline).foregroundColor(.gray)
                    }
                    Spacer()
                    Text(String(format: "%.1f miles", trail.distance))
                }
            })

        }
    }
    
    var body: some View {
        List {
            Section(header: ListHeader(), footer: ListFooter()) {
                ForEach(hikingTrails) { trail in
                    TrailRow(trail: trail)
                }
            }
        }
    }
}

struct ListHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "map")
            Text("Hiking Trails in Silicon Valley")
        }
    }
}

struct ListFooter: View {
    var body: some View {
        Text("Remember to pack plenty of water and bring sunscreen.")
    }
}

struct ExcerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExcerciseView()
    }
}
