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
    var createdAt: Date
    var updatedAt: Date
}

struct Response: Decodable {
    var data : [Location]
}

extension DateFormatter {
    static let fullISO8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

class Api : ObservableObject{
    @Published var locations = [Location]()
    
    func loadData(completion:@escaping ([Location]) -> ()) {
        guard let url = URL(string: "https://holiday-api.jump24.dev/api/locations") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder =  JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                   if let decodedResponse = try? decoder.decode(Response.self, from: data) {
                       print(decodedResponse)
                       DispatchQueue.main.async {
                           self.locations = decodedResponse.data
                       }
                       return
                   }
               }
               print("Fetch failed:")
            
            if let error = error as NSError? {
                print("task transport error ", error.domain, error.code, error)
                return
            }
        }.resume()
    }
}
