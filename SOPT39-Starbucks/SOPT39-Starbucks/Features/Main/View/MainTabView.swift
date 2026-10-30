//
//  MainTabView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: MainTab = .order
    @State private var orderPath: [OrderRoute] = []
    @State private var menuViewModel = MenuViewModel()

    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case .order:
                OrderView(path: $orderPath, menuViewModel: menuViewModel)
            default:
                Text(selectedTab.title)
                    .typography(.head1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            if !isTabBarHidden {
                MainTabBar(selectedTab: $selectedTab)
            }
        }
    }

    private var isTabBarHidden: Bool {
        if case .menuDetail? = orderPath.last {
            return true
        }
        return false
    }
}

#Preview {
    MainTabView()
}
