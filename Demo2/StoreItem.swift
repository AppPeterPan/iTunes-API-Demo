//
//  StoreItem.swift
//  Demo2
//
//  Created by Peter Pan on 2022/11/30.
//

import Foundation

struct SearchResponse: Codable {
    let results: [StoreItem]
}

struct StoreItem: Codable, Identifiable {
    var id: Int { trackId }
    let trackId: Int
    let trackName: String
    let artistName: String
}
