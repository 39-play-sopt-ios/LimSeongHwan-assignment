//
//  OrderView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/25/26.
//

import SwiftUI

struct OrderView: View {
    @State private var selectedTab: MenuTab = .allMenu
    @State private var selectedCategory: MenuCategory = .drink
    
    var body: some View {
        VStack(spacing: 0) {
            MainHeader(showsBackButton: false)
            
            Text("Order")
                .typography(.head1)
                .padding(.leading, 18)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity ,alignment: .leading)
            
            HStack(spacing: 0) {
                ForEach(MenuTab.all, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        OrderMenuTab(tabText: tab.tabText, isSelected: selectedTab == tab)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .fill(.gray200)
                .frame(height: 1)
            
            categoryBar
            
            Rectangle()
                .fill(.gray250)
                .frame(height: 1)
            
            categoryList
            
            OrderShoppingCartBar(storeName: "성수역", basketCount: 0)
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
            OrderCategoryListItem(data: category)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 21, trailing: 0))
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .contentMargins(.top, 26, for: .scrollContent)
    }
}

extension OrderView {
    enum MenuTab {
        case allMenu, myMenu
        
        static let all: [MenuTab] = [.allMenu, .myMenu]
        
        var tabText: String {
            switch self {
            case .allMenu:
                return "전체 메뉴"
            case .myMenu:
                return "나만의 메뉴"
            }
        }
    }
    
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
    OrderView()
}
