//
//  HTTPDataDownloader.swift
//  Earthquakes
//
//  Created by Marcel on 17.10.2023.
//

import Foundation.NSData

let validStatus = 200...299

protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse), validStatus.contains(response.statusCode) else {
            throw QuakeError.networkError
        }
        return data
    }
}