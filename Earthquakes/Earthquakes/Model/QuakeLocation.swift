//
//  QuakeLocation.swift
//  Earthquakes
//
//  Created by Marcel on 17.10.2023.
//

import Foundation

struct QuakeLocation: Decodable {
    var latitude: Double { properties.products.origin.first!.properties.latitude }
    var longitude: Double { properties.products.origin.first!.properties.longitude }
    private let properties: RootProperties

    struct RootProperties: Decodable {
        let products: Products
    }

    struct Products: Decodable {
        let origin: [Origin]
    }

    struct Origin: Decodable {
        let properties: OriginProperties
    }

    struct OriginProperties {
        let latitude: Double
        let longitude: Double
    }
}

extension QuakeLocation.OriginProperties: Decodable {
    private enum OriginPropertiesCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
        let longitude = try container.decode(String.self, forKey: .longitude)
        let latitude = try container.decode(String.self, forKey: .latitude)
        guard let longitude = Double(longitude),
              let latitude = Double(latitude) else { throw QuakeError.missingData }
        self.longitude = longitude
        self.latitude = latitude
    }
}
