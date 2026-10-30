//
//  AllMenuView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct AllMenuView: View {
    @Binding var path: [OrderRoute]

    @State private var selectedCategory: MenuCategory = .drink

    var body: some View {
        VStack(spacing: 0) {
            categoryBar

            Rectangle()
                .fill(.gray250)
                .frame(height: 1)

            categoryList
        }
    }

    private var categoryBar: some View {
        HStack(spacing: 28) {
            ForEach(MenuCategory.allCases, id: \.self) { category in
                Button {
                    selectedCategory = category
                } label: {
                    Text(category.title)
                        .typography(.medium2)
                        .foregroundStyle(selectedCategory == category ? .black : .gray500)
                }
            }
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 42)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var categoryList: some View {
        List(selectedCategory == .drink ? OrderCategoryModel.data : []) { category in
            Button {
                if let route = category.route {
                    path.append(route)
                }
            } label: {
                OrderCategoryListItem(data: category)
            }
            .listRowInsets(EdgeInsets(top: 10.5, leading: 0, bottom: 10.5, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .contentMargins(.top, 15.5, for: .scrollContent)
    }
}

extension AllMenuView {
    enum MenuCategory: CaseIterable {
        case drink, food, goods

        var title: String {
            switch self {
            case .drink:
                return "음료"
            case .food:
                return "푸드"
            case .goods:
                return "상품"
            }
        }
    }
}

#Preview {
    AllMenuView(path: .constant([]))
}
