//
//  AirportListViewModel.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class AirportListViewModel: ObservableObject {
    @Published var airports: [Airport] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func fetchAirports() async {
        isLoading = true
        errorMessage = nil

        do {
            let fetchedAirports = try await apiService.fetchAirports()
            airports = fetchedAirports.sorted(by: { $0.airportName < $1.airportName })
        } catch {
            errorMessage = "Failed to fetch airports: \(error.localizedDescription)"
        }

        isLoading = false
    }
}


