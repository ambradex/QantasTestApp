//
//  AirportListViewModelTests.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import XCTest
@testable import QantasTestApp

@MainActor
final class AirportListViewModelTests: XCTestCase {

    func testFetchAirports_Success() async {
        let mockService = MockAPIService(shouldFail: false)
        let viewModel = AirportListViewModel(apiService: mockService)

        await viewModel.fetchAirports()

        XCTAssertFalse(viewModel.airports.isEmpty, "Airports should be populated on success")
        XCTAssertNil(viewModel.errorMessage, "errorMessage should be nil on success")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false after completion")
        XCTAssertEqual(viewModel.airports.first?.airportCode, "AAA")
    }

    func testFetchAirports_Failure() async {
        let mockService = MockAPIService(shouldFail: true)
        let viewModel = AirportListViewModel(apiService: mockService)

        await viewModel.fetchAirports()

        XCTAssertTrue(viewModel.airports.isEmpty, "Airports should be empty when service fails")
        XCTAssertNotNil(viewModel.errorMessage, "errorMessage should be set when service fails")
        XCTAssertFalse(viewModel.isLoading, "isLoading should be false after failure")
    }
}

fileprivate final class MockAPIService: APIServiceProtocol {
    private let shouldFail: Bool

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func fetchAirports() async throws -> [Airport] {
        if shouldFail {
            throw URLError(.badServerResponse)
        }

        return [
            Airport(
                airportCode: "AAA",
                internationalAirport: false,
                domesticAirport: false,
                regionalAirport: false,
                onlineIndicator: false,
                eticketableAirport: false,
                location: Location(
                    aboveSeaLevel: -99999,
                    latitude: 17.25,
                    latitudeRadius: -0.304,
                    longitude: 145.3,
                    longitudeRadius: -2.5395,
                    latitudeDirection: "S",
                    longitudeDirection: "W"
                ),
                airportName: "Anaa",
                city: City(
                    cityCode: "AAA",
                    cityName: "Anaa",
                    timeZoneName: "Pacific/Tahiti"
                ),
                state: State(stateCode: nil, stateName: nil),
                country: Country(countryCode: "PF", countryName: "French Polynesia"),
                region: Region(regionCode: "SP", regionName: "South Pacific")
            )
        ]
    }
}
