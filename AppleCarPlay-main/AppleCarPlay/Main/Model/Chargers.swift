import Foundation

struct Chargers: Codable, Identifiable{
    let id: Int
    let name: String
    let location: String
    let avaPorts: Int
}

struct Users: Codable, Identifiable {
    let id: UUID
    let NID: Int
    let name: String
    let validDriveLicense: Bool
    let phoneNumber: Int
}

struct Cars: Codable, Identifiable {
    let id: UUID
    let carName: String
    let milesLeft: Int
    let chargePercentage: Int
    let NID: Int
    let carModel: Int
}
