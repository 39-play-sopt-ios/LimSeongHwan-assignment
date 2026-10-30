//
//  OrderView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/25/26.
//

import SwiftUI

struct OrderView: View {
    @State private var selectedTab: MenuTab = .allMenu
    @State private var path: [OrderRoute] = []
    @State private var menuViewModel = MenuViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                
                switch selectedTab {
                case .allMenu:
                    AllMenuView(path: $path)
                case .myMenu:
                    MyMenuView(menuViewModel: menuViewModel)
                }
                
                OrderShoppingCartBar(storeName: "성수역", basketCount: 0)
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: OrderRoute.self) { route in
                switch route {
                case .newMenu:
                    NewMenuView(path: $path, menuViewModel: menuViewModel)
                case .menuDetail(let id):
                    MenuDetailView(menuId: id, menuViewModel: menuViewModel)
                }
            }
        }
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
}

#Preview {
    OrderView()
}
