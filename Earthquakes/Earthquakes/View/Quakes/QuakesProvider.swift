//
//  QuakesProvider.swift
//  Earthquakes
//
//  Created by Marcel on 18.10.2023.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {

    // MARK: - Published

    @Published var quakes: [Quake] = []

    // MARK: - Internal

    let client: QuakeClient

    // MARK: - Init

    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }

    // MARK: - Methods

    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }

    func location(for quake: Quake) async throws -> QuakeLocation {
        return try await client.quakeLocation(from: quake.detail)
    }

    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
}
