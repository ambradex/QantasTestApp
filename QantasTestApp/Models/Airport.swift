//
//  Airport.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import Foundation

struct Airport: Codable, Identifiable, Hashable {
    var id: String { airportCode }

    let airportCode: String
    let internationalAirport: Bool
    let domesticAirport: Bool
    let regionalAirport: Bool
    let onlineIndicator: Bool
    let eticketableAirport: Bool
    let location: Location
    let airportName: String
    let city: City?
    let state: State?
    let country: Country?
    let region: Region?
}

struct Location: Codable, Hashable {
    let aboveSeaLevel: Int?
    let latitude: Double?
    let latitudeRadius: Double?
    let longitude: Double?
    let longitudeRadius: Double?
    let latitudeDirection: String?
    let longitudeDirection: String?
}

struct City: Codable, Hashable {
    let cityCode: String?
    let cityName: String?
    let timeZoneName: String
}

struct State: Codable, Hashable {
    let stateCode: String?
    let stateName: String?
}

struct Country: Codable, Hashable {
    let countryCode: String
    let countryName: String
}

struct Region: Codable, Hashable {
    let regionCode: String
    let regionName: String
}
