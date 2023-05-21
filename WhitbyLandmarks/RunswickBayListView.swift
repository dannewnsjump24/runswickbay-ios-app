//
//  RunswickBayListView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 21/05/2023.
//

import SwiftUI
import MapKit

struct RunswickBayListView: View {
    let places = [
        Place(name: "Runswick Bay", coordinate: CLLocationCoordinate2D(latitude:54.5322, longitude: -0.7368)),
        Place(name: "RedCar Beach", coordinate: CLLocationCoordinate2D(latitude: 54.6199, longitude: -1.0661)),
        Place(name: "Whitby", coordinate: CLLocationCoordinate2D(latitude: 54.4863, longitude: -0.6133)),
        Place(name: "Saltburn", coordinate: CLLocationCoordinate2D(latitude: 54.5816, longitude: -0.9751)),
        Place(name: "Robin Hood's Bay", coordinate: CLLocationCoordinate2D(latitude: 54.4344, longitude: -0.5350))
    ]
    
    var body: some View {
        NavigationView {
            List(places) {
                place in
                NavigationLink {
                    DetailedLocationView(place: place).navigationTitle(place.name)
                } label: {
                    PlaceRow(place: place)
                }
               
            }
        }
    }
}

struct RunswickBayListView_Previews: PreviewProvider {
    static var previews: some View {
        RunswickBayListView()
    }
}

struct PlaceRow: View {
    var place: Place

    var body: some View {
        Text("\(place.name)")
    }
}
