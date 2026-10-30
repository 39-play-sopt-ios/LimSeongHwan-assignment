//
//  MyMenuListItem.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MyMenuListItem: View {
    let menu: MenuModel
    let onLikeTap: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            Image(menu.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(menu.name)
                        .typography(.subhead2)
                        .foregroundStyle(.gray800)

                    Text(menu.englishName)
                        .typography(.caption)
                        .foregroundStyle(.gray280)
                }

                Text(menu.priceText)
                    .typography(.subhead2)
                    .foregroundStyle(.gray800)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Button(action: onLikeTap) {
                Image(.favoriteGreen)
            }
            .buttonStyle(.borderless)
            .padding(.top, 14)
            .frame(height: 90, alignment: .top)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
    }
}

#Preview {
    MyMenuListItem(menu: MenuModel.newMenus[0]) {}
}
