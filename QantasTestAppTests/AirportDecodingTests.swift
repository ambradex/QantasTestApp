//
//  AirportDecodingTests.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import XCTest
@testable import QantasTestApp

final class AirportDecodingTests: XCTestCase {
    func testAirportDecodingSuccess() throws {
        let json = """
        [
              {
                "airportCode": "AAA",
                "internationalAirport": false,
                "domesticAirport": false,
                "regionalAirport": false,
                "onlineIndicator": false,
                "eticketableAirport": false,
                "location": {
                  "aboveSeaLevel": -99999,
                  "latitude": 17.25,
                  "latitudeRadius": -0.304,
                  "longitude": 145.3,
                  "longitudeRadius": -2.5395,
                  "latitudeDirection": "S",
                  "longitudeDirection": "W"
                },
                "airportName": "Anaa",
                "city": {
                  "cityCode": "AAA",
                  "cityName": "Anaa",
                  "timeZoneName": "Pacific/Tahiti"
                },
                "state": {

                },
                "country": {
                  "countryCode": "PF",
                  "countryName": "French Polynesia"
                },
                "region": {
                  "regionCode": "SP",
                  "regionName": "South Pacific"
                }
              }
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let airports = try decoder.decode([Airport].self, from: json)
        
        XCTAssertEqual(airports.count, 1)
        XCTAssertEqual(airports.first?.airportName, "Anaa")
        XCTAssertEqual(airports.first?.airportCode, "AAA")
        XCTAssertEqual(airports.first?.country?.countryName, "French Polynesia")
        XCTAssertEqual(airports.first?.region?.regionName, "South Pacific")
    }

    func testAirportDecodingFailsForInvalidJSON() {
        let invalidJSON = """
        { "airport": "Missing Array" }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        XCTAssertThrowsError(try decoder.decode([Airport].self, from: invalidJSON))
    }
}
