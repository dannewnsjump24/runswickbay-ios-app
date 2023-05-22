//
//  Location.swift
//  WhitbyLandmarks
//
//  Created by dannewns on 21/05/2023.
//

import Foundation

struct Location: Codable, Identifiable {
    let id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    var created_at: Date
    var updated_at: Date
}

class Api : ObservableObject{
    @Published var locations = [Location]()
    
    func loadData(completion:@escaping ([Location]) -> ()) {
        guard let url = URL(string: "https://holiday-api.test/api/locations") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error as NSError? {
                NSLog("task transport error %@ / %d", error.domain, error.code)
                return
            }
            
            let locations = try! JSONDecoder().decode([Location].self, from: data!)
            print(locations)
            //            print(locations)
            //            DispatchQueue.main.async {
            //                completion(locations)
            //            }
        }.resume()
    }
}
