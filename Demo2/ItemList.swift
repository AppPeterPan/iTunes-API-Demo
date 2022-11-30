//
//  ItemList.swift
//  Demo2
//
//  Created by Peter Pan on 2022/11/30.
//

import SwiftUI

struct ItemList: View {
    @EnvironmentObject var fetcher: ItunesDataFetcher
    
    var body: some View {
        List {
            ForEach(fetcher.items) { item in
                ItemRow(item: item)
            }
        }
        .alert(isPresented: $fetcher.showError, content: {
            Alert(title: Text("\(fetcher.error!.localizedDescription)"))
        })
        .onAppear {
            fetcher.fetchData(term: "周杰倫")
        }
    }
}

struct ItemList_Previews: PreviewProvider {
    static var previews: some View {
        ItemList()
    }
}
