//
//  ItemRow.swift
//  Demo2
//
//  Created by Peter Pan on 2022/11/30.
//

import SwiftUI

struct ItemRow: View {
    let item: StoreItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.trackName)
            Text(item.artistName)
        }
    }
}

//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRow()
//    }
//}
