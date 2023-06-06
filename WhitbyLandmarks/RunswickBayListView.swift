//
//  RunswickBayListView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 21/05/2023.
//

import SwiftUI
import MapKit

struct RunswickBayListView: View {
    @EnvironmentObject var locationApi: Api
    
    var body: some View {
        NavigationView {
            List(locationApi.locations, id: \.id) { location in
                NavigationLink {
                    DetailedLocationView(place: location).navigationTitle(location.name)
                } label: {
                    PlaceRow(place: location)
                }

            }
        }
    }
}

struct RunswickBayListView_Previews: PreviewProvider {
    static var previews: some View {
        RunswickBayListView()
            .environmentObject(Api())
    }
}

struct PlaceRow: View {
    var place: Location

    var body: some View {
        Text("\(place.name)")
    }
}
