import SwiftUI

struct Address : Codable{
    let street: String
    let suite : String
    let city: String
    let zipcode: String
    let geo : Geo
}
struct  Company: Codable {
    let name : String
    let catchPhrase: String
    let bs : String
}
struct  Geo : Codable {
    let lat : String
    let lng : String
}

struct Users: Codable, Identifiable {
    let id = UUID()
    let name : String
    let username : String
    let email : String
    let phone: String
    let website: String
    let address :Address
    let company :Company
    
}


