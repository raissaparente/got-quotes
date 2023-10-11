//
//  remoteQuoteLoader.swift
//  gotQuotes
//
//  Created by Raissa Parente on 04/10/23.
//

import Foundation

func fetchQuoteFromAPI() async throws -> Quote {
    guard let url = URL(string: "https://api.gameofthronesquotes.xyz/v1/random") else {
        throw APIError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw APIError.invalidResponse
    }
    
    do {
        return try JSONDecoder().decode(Quote.self, from: data)
    } catch {
        throw APIError.invalidDecoder
    }
}


enum APIError: Error {
    case invalidResponse
    case invalidURL
    case invalidDecoder
}
