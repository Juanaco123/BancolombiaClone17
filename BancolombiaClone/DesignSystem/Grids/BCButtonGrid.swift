//
//  ButtonGrid.swift
//  BancolombiaClone
//
//  Created by Juan Camilo Victoria Pacheco on 5/09/24.
//

import Foundation
import SwiftUI

struct BCButtonGrid: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: [GridItem()], content: {
                ForEach(Transaccions.allCases) { transactionType in
                    BCButton(
                        text: transactionType.rawValue,
                        icon: transactionType.icon
                    )
                    .padding(.trailing, 5)
                    .padding(.vertical, 10)
                }
            })
        }
        .ignoresSafeArea()
    }
}

struct BCButtonGrid_Preview: PreviewProvider {
    static var previews: some View {
        BCButtonGrid()
    }
}
