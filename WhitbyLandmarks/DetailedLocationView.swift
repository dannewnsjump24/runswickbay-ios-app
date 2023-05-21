//
//  DetailedLocationView.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 19/05/2023.
//

import SwiftUI
import MapKit

struct DetailedLocationView: View {
    let place: Place
    let images = ["runswick-bay", "runswick-bay"]
    var body: some View {
        VStack {
            Map(coordinateRegion: .constant(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude:place.coordinate.latitude, longitude: place.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))),
                annotationItems: [place]
            ) {  place in
                MapAnnotation(coordinate: place.coordinate) {
                    PlaceAnnotationView(title: place.name)
                }
            }.edgesIgnoringSafeArea(.all).background(.red)
            
            
            TabView {
                ForEach(images, id:\.self) { image in
                    Image(image).resizable().ignoresSafeArea()
                }
            }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .edgesIgnoringSafeArea(.all)
                .background(.yellow)
        }.fixedSize(horizontal: false, vertical: false)
    }
}

struct DetailedLocationView_Previews: PreviewProvider {
    static var previews: some View {
        let previewPlace = Place(
            name: "Tester",
            coordinate: CLLocationCoordinate2D(latitude: 54.6199, longitude: -1.0661)
        );
        
        DetailedLocationView(place: previewPlace)
    }
}
