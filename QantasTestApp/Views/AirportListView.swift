//
//  AirportListViewModel.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import SwiftUI

@MainActor
struct AirportListView: View {
    @StateObject private var viewModel: AirportListViewModel

    init(viewModel: AirportListViewModel? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel ?? AirportListViewModel())
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Airports...")
                        .accessibilityIdentifier("LoadingView")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .accessibilityIdentifier("ErrorView")
                } else {
                    List(viewModel.airports) { airport in
                        NavigationLink(value: airport) {
                            VStack(alignment: .leading) {
                                Text(airport.airportName)
                                    .font(.headline)
                                Text(airport.city?.cityName ?? "Unknown City")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .accessibilityIdentifier("AirportCell_\(airport.airportCode)")
                    }
                    .accessibilityIdentifier("AirportList")
                    .navigationDestination(for: Airport.self) { airport in
                        AirportDetailView(airport: airport)
                    }
                }
            }
            .navigationTitle("Airports")
            .task {
                await viewModel.fetchAirports()
            }
        }
    }
}







