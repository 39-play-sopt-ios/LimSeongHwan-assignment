//
//  MenuDetailBottomBar.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MenuDetailBottomBar: View {
    let isLiked: Bool
    let onLikeTap: () -> Void
    let onOrderTap: () -> Void

    var body: some View {
        HStack(spacing: 20) {
            Button(action: onLikeTap) {
                Image(isLiked ? .favoriteGreen : .favoriteGrey)
            }

            Button(action: onOrderTap) {
                Text("주문하기")
                    .typography(.subhead2)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Capsule().fill(.subGreen))
            }
        }
        .padding(.leading, 21)
        .padding(.trailing, 24)
        .padding(.top, 14)
        .padding(.bottom, 10)
        .background(.white)
        .shadow(color: .black.opacity(0.1), radius: 6.5, y: -2)
    }
}

#Preview {
    MenuDetailBottomBar(isLiked: false, onLikeTap: {}, onOrderTap: {})
    MenuDetailBottomBar(isLiked: true, onLikeTap: {}, onOrderTap: {})
}
