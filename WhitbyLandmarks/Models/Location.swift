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

struct APIResponse: Decodable {
    var data: [Location]
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
    @Published var locations: [Location] = []
    
    func loadData() async throws {
        let endpoint = "https://holiday-api.jump24.dev/api/locations"
        
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }
    
        do {
            let decoder =  JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.fullISO8601)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let dataResponse = try JSONDecoder().decode(APIResponse.self, from: data)
        
            print(dataResponse)
            DispatchQueue.main.async {
                self.locations = dataResponse.data
            }
    
        } catch {
            throw ApiError.invalidData
        }
    }
}
