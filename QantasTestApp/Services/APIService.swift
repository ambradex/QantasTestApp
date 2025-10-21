//
//  APIService.swift
//  QantasTestApp
//
//  Created by dexter.a.m.ambrad on 10/20/25.
//

import Foundation

final class APIService: APIServiceProtocol {
    static let shared = APIService()
    init() {}

    private let baseURL = Config.baseURL

    func fetchAirports() async throws -> [Airport] {
        guard let url = URL(string: "\(baseURL)/flight/refData/airport") else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode([Airport].self, from: data)
        } catch let decodingError as DecodingError {
            throw decodingError
        }
    }
}


enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(code: Int)
    case decodingError(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The API URL is invalid."
        case .invalidResponse:
            return "No valid response from server."
        case .httpError(let code):
            return "HTTP error: \(code)"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}

