//
//  RunswickBayMapView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct RunswickBayMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude:54.5322, longitude: -0.7368), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    let annotations = [
        Place(name: "Runswick Bay", coordinate: CLLocationCoordinate2D(latitude:54.5322, longitude: -0.7368)),
        Place(name: "RedCar Beach", coordinate: CLLocationCoordinate2D(latitude: 54.6199, longitude: -1.0661)),
        Place(name: "Whitby", coordinate: CLLocationCoordinate2D(latitude: 54.4863, longitude: -0.6133)),
        Place(name: "Saltburn", coordinate: CLLocationCoordinate2D(latitude: 54.5816, longitude: -0.9751)),
        Place(name: "Robin Hood's Bay", coordinate: CLLocationCoordinate2D(latitude: 54.4344, longitude: -0.5350))
    ]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: annotations) {
                place in
                MapAnnotation(coordinate: place.coordinate) {
                    NavigationLink {
                        DetailedLocationView(place: place).navigationTitle(place.name)
                    } label: {
                        PlaceAnnotationView(title: place.name)
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
    
    struct RunswickBayMapView_Previews: PreviewProvider {
        static var previews: some View {
            RunswickBayMapView()
        }
    }
    
}
