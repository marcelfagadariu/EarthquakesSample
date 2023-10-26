//
//  CacheEntryObject.swift
//  Earthquakes
//
//  Created by Marcel on 26.10.2023.
//

import Foundation

final class CacheEntryObject {
    let entry: CacheEntry

    init(entry: CacheEntry) {
        self.entry = entry
    }
}

enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
