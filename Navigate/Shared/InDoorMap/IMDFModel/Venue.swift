/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The decoded representation of an IMDF Venue feature type.
*/

import Foundation

class Venue: IDMFeature<Venue.Properties> {
    struct Properties: Codable {
        let category: String
    }
    
    var levelsByOrdinal: [Int: [IDMLevel]] = [:]
}

// For more information about this class, see: https://register.apple.com/resources/imdf/Venue/
