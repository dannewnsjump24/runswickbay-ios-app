//
//  ContentView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var locations = [Location]()
    
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
           ListView()
                .tabItem {
                    Label("List", systemImage: "table")
                }
        }
        .onAppear() {
            Api().loadData { (locations) in
                self.locations = locations
            }

            UITabBar.appearance().backgroundColor = .white
        }
    }
        
}

struct MapView: View {
    var body: some View {
        RunswickBayMapView()
    }
}

struct ListView: View {
    var body: some View {
        RunswickBayListView()
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .navigationTitle("List")
    }
}
