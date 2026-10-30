//
//  MenuListItem.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MenuListItem: View {
    let menu: MenuModel

    var body: some View {
        HStack(spacing: 12) {
            Image(menu.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(menu.name)
                        .typography(.subhead2)
                        .foregroundStyle(.gray800)

                    Text(menu.englishName)
                        .typography(.body1)
                        .foregroundStyle(.gray280)
                }

                Text(menu.priceText)
                    .typography(.subhead2)
                    .foregroundStyle(.gray800)
            }

            Spacer()
        }
        .padding(.horizontal, 21)
        .padding(.vertical, 14)
    }
}

#Preview {
    MenuListItem(menu: MenuModel.newMenus[0])
}
