//
//  ContentView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationApi: Api
    @State private var isLoggedIn = false
    var body: some View {
        if !self.isLoggedIn {
            LoginView()
        } else {
            TabView {
                MapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                ListView()
                    .tabItem {
                        Label("List", systemImage: "table")
                    }
            }.task {
                do {
                    try await locationApi.loadData()
                } catch ApiError.invalidData {
                    print("Invalid Data")
                } catch ApiError.invalidUrl {
                    print("Invalid URL")
                } catch ApiError.invalidResponse {
                    print("Invalid Response")
                } catch {
                    print("Error")
                }
            }
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
            .environmentObject(Api())
    }
}
