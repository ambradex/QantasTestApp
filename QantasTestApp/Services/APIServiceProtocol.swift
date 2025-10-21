//
//  APIServiceProtocol.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import Foundation

protocol APIServiceProtocol {
    func fetchAirports() async throws -> [Airport]
}
