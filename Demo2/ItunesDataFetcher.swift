//
//  ItunesDataFetcher.swift
//  Demo2
//
//  Created by Peter Pan on 2022/11/30.
//

import Foundation

class ItunesDataFetcher: ObservableObject {
    @Published var items = [StoreItem]()
    
    var error: Error? {
        willSet {
            DispatchQueue.main.async {
                self.showError = newValue != nil
            }
        }
    }
    @Published var showError = false

    enum FetchError: Error {
        case invalidURL
    }
    
    func fetchData(term: String) {
        let urlString = "https://itunes.apple.com/search?term=\(term)&media=music&country=tw"
        
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString) else {
                  error = FetchError.invalidURL
                  return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error  in
            if let data = data {
                do {
                    let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.items = searchResponse.results
                        self.error = nil
                    }
                } catch  {
                    self.error = error
                }
            } else {
                self.error = error
            }
        }.resume()
        
    }
}
