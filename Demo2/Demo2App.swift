//
//  Demo2App.swift
//  Demo2
//
//  Created by Peter Pan on 2022/11/30.
//

import SwiftUI

@main
struct Demo2App: App {
    @StateObject var fetcher = ItunesDataFetcher()
    
    var body: some Scene {
        WindowGroup {
            ItemList()
                .environmentObject(fetcher)
        }
    }
}
