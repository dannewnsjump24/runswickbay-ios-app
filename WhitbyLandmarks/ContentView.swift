//
//  ContentView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            RunswickBayMapView()
                //.frame(height: 400).offset(y:-112)
//            RunswickBayImage()
//                .clipShape(Circle())
//                .overlay {
//                    Circle().stroke(.white, lineWidth: 4)
//                }.offset(y:-80)
//            .shadow(radius: 7)
//            Text("Holiday App").font(.title).offset(y:-40)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
