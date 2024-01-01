import Foundation
import MapKit
import SwiftUI

struct MapModel : Identifiable {
    let id : Int
    var location : CLLocationCoordinate2D
    var MainAddress  : String
    var StreetAddress : String
    var portsAvailable : String
    var portType : String
    var cost : String
    var Power : String
}

var ChargingLocations = [
    MapModel(id: 0, location: CLLocationCoordinate2D( latitude: 24.892090, longitude: 46.714850),MainAddress: "King Khalid Airport Charging Station", StreetAddress: "VMQW+9H8, King Khalid International Airport, Riyadh 13418", portsAvailable: "10 ports Available", portType: "Level 1", cost: "$0.2 per KWH", Power: "200 A, 96KWH"),
    MapModel(id: 1, location: CLLocationCoordinate2D(latitude: 24.827430, longitude: 46.720620),MainAddress: "King Khalid Airport Second Charging Station", StreetAddress: "RPRM+Q3V, King Khalid International Airport, Riyadh 13413", portsAvailable: "10 ports Available", portType: "Level 3", cost: "$0.2 per KWH", Power: "200 A, 96KWH"),
    MapModel(id: 2, location: CLLocationCoordinate2D(latitude: 24.678490, longitude: 46.636100),MainAddress: "An Nakheel Charging Station", StreetAddress: "PJRM+6WP, An Nakheel, Riyadh 12382", portsAvailable: "10 ports Available", portType: "Level 2", cost: "$0.2 per KWH", Power: "200 A, 96KWH"),
    MapModel(id: 3, location: CLLocationCoordinate2D(latitude: 24.745260, longitude: 46.640330),MainAddress: "Al Safarat Charging Station", StreetAddress: "MJFF+H68, Al Safarat, Riyadh 12511", portsAvailable: "10 ports Available", portType: "Level 3", cost: "$0.2 per KWH", Power: "200 A, 96KWH")
]
