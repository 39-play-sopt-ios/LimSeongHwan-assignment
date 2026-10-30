//
//  NewMenuView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct NewMenuView: View {
    @Binding var path: [OrderRoute]

    let menuViewModel: MenuViewModel

    var body: some View {
        VStack(spacing: 0) {
            MainHeader()

            Text("NEW")
                .typography(.head1)
                .padding(.leading, 18)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity, alignment: .leading)

            List(menuViewModel.newMenus) { menu in
                Button {
                    path.append(.menuDetail(id: menu.id))
                } label: {
                    MenuListItem(menu: menu)
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .contentMargins(.top, 18, for: .scrollContent)

            OrderShoppingCartBar(storeName: "성수역", basketCount: 0)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NewMenuView(path: .constant([]), menuViewModel: MenuViewModel())
}
