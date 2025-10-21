//
//  AirportDetailViewModel.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class AirportDetailViewModel: ObservableObject {
    @Published var airport: Airport

    init(airport: Airport) {
        self.airport = airport
    }
}
