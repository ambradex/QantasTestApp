//
//  QantasTestAppApp.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import SwiftUI

@main
struct QantasTestApp: App {
    var body: some Scene {
        WindowGroup {
            let apiService: APIServiceProtocol = APIService()
            
            AirportListView(
                viewModel: AirportListViewModel(apiService: apiService)
            )
        }
    }
}
