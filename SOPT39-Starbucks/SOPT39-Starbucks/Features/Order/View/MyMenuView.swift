//
//  MyMenuView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MyMenuView: View {
    let menuViewModel: MenuViewModel

    var body: some View {
        if menuViewModel.likedMenus.isEmpty {
            Text("등록된 나만의 메뉴가 없어요.\n즐겨 찾는 음료나 푸드를 나만의 메뉴로 등록하고\n빠르게 주문해 보세요.")
                .typography(.body3)
                .foregroundStyle(.gray300)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 21)
                .padding(.top, 43)
                .frame(maxHeight: .infinity, alignment: .top)
        } else {
            List(menuViewModel.likedMenus) { menu in
                MyMenuListItem(menu: menu) {
                    withAnimation {
                        menuViewModel.toggleLike(id: menu.id)
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    MyMenuView(menuViewModel: MenuViewModel())
}
