//
//  WhitbyLandmarksApp.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI

@main
struct WhitbyLandmarksApp: App {
    var locationApi = Api();
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationApi)
        }
    }
}
