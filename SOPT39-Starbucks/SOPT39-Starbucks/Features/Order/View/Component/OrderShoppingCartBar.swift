//
//  OrderShoppingCartBar.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct OrderShoppingCartBar: View {
    let storeName: String
    let basketCount: Int

    var body: some View {
        HStack {
            VStack(spacing: 0) {
                HStack {
                    Text(storeName)
                        .typography(.storeName)
                        .foregroundStyle(.white)

                    Spacer()

                    Image(.chevronBottomWhite)
                }
                .padding(.vertical, 4)

                Rectangle()
                    .fill(.gray700)
                    .frame(height: 1)
            }
            .frame(width: 239)

            Spacer()

            Image(.buyEmpty)
                .overlay {
                    Text("\(basketCount)")
                        .typography(.basketCount)
                        .foregroundStyle(.white)
                        .offset(y: 3)
                }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 9)
        .background(.mainBlack)
    }
}

#Preview {
    OrderShoppingCartBar(storeName: "성수역", basketCount: 0)
}
