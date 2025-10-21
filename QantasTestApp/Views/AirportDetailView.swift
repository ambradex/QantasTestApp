//
//  AirportDetailView.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import SwiftUI

struct AirportDetailView: View {
    let airport: Airport

    var body: some View {
        List {
            Section(header: Text("General").accessibilityIdentifier("GeneralSectionHeader")) {
                DetailRow(title: "Code", value: airport.airportCode)
                DetailRow(title: "Name", value: airport.airportName)
                DetailRow(title: "Country", value: airport.country?.countryName ?? "Unknown Country")
                DetailRow(title: "Region", value: airport.region?.regionName ?? "Unknown Region")
                DetailRow(title: "City", value: airport.city?.cityName ?? "Unknown City")
            }
            .accessibilityIdentifier("GeneralSection")

            Section(header: Text("Location").accessibilityIdentifier("LocationSectionHeader")) {
                DetailRow(
                    title: "Latitude",
                    value: "\(airport.location.latitude, default: "-")° \(airport.location.latitudeDirection ?? "_")"
                )
                DetailRow(
                    title: "Longitude",
                    value: "\(airport.location.longitude, default: "-")° \(airport.location.longitudeDirection ?? "-")"
                )
                DetailRow(
                    title: "Above Sea Level",
                    value: "\(airport.location.aboveSeaLevel, default: "-")m"
                )
            }
            .accessibilityIdentifier("LocationSection")

            Section(header: Text("Airport Type").accessibilityIdentifier("TypeSectionHeader")) {
                DetailRow(title: "International", value: airport.internationalAirport ? "Yes" : "No")
                DetailRow(title: "Domestic", value: airport.domesticAirport ? "Yes" : "No")
                DetailRow(title: "Regional", value: airport.regionalAirport ? "Yes" : "No")
                DetailRow(title: "E-ticketable", value: airport.eticketableAirport ? "Yes" : "No")
            }
            .accessibilityIdentifier("TypeSection")
        }
        .accessibilityIdentifier("AirportDetailList")
        .navigationTitle(airport.airportName)
    }
}

struct DetailRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .fontWeight(.medium)
                .multilineTextAlignment(.trailing)
        }
        .accessibilityIdentifier("DetailRow_\(title)")
    }
}

