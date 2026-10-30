//
//  MenuDetailView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MenuDetailView: View {
    let menuId: UUID
    let menuViewModel: MenuViewModel

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        if let menu = menuViewModel.menu(id: menuId) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Image(menu.image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 333)
                        .clipped()

                    menuInfo(menu)

                    Button {
                    } label: {
                        Text(menu.temperature)
                            .typography(.subhead2)
                            .foregroundStyle(.mainBlue)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 11)
                            .background(Capsule().fill(.white))
                            .overlay(Capsule().stroke(.gray200))
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 18)

                    if let notice = menu.notice {
                        Text(notice)
                            .typography(.body3)
                            .foregroundStyle(.gray500)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 21)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.gray100)
                            .padding(.horizontal, 21)
                            .padding(.top, 14)
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            .overlay(alignment: .top) {
                HStack {
                    DetailCircleButton(icon: .chevronLeftWhite) {
                        dismiss()
                    }

                    Spacer()

                    DetailCircleButton(icon: .shareWhite) {}
                }
                .padding(.horizontal, 21)
                .padding(.vertical, 14)
            }
            .safeAreaInset(edge: .bottom) {
                MenuDetailBottomBar(isLiked: menu.isLiked) {
                    menuViewModel.toggleLike(id: menu.id)
                } onOrderTap: {}
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }

    private func menuInfo(_ menu: MenuModel) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 9) {
                Text(menu.name)
                    .typography(.head2)
                    .foregroundStyle(.gray800)

                if menu.isNew {
                    Text("NEW")
                        .typography(.subhead2)
                        .foregroundStyle(.pointGreen)
                }
            }
            .padding(.vertical, 7)

            Text(menu.englishName)
                .typography(.body1)
                .foregroundStyle(.gray280)

            Text(menu.description)
                .typography(.body3)
                .foregroundStyle(.gray800)
                .padding(.vertical, 14)

            Text(menu.priceText)
                .typography(.head2)
                .foregroundStyle(.black)
                .padding(.vertical, 14)
        }
        .padding(.horizontal, 21)
        .padding(.top, 21)
    }
}

#Preview {
    let menuViewModel = MenuViewModel()

    MenuDetailView(menuId: menuViewModel.newMenus[0].id, menuViewModel: menuViewModel)
}
