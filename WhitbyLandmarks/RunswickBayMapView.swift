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
    @EnvironmentObject var locationApi: Api
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude:54.5322, longitude: -0.7368), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region, annotationItems: locationApi.locations) {
                location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        DetailedLocationView(place: location).navigationTitle(location.name)
                    } label: {
                        PlaceAnnotationView(title: location.name)
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
