//
//  MainTabBar.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct MainTabBar: View {
    @Binding var selectedTab: MainTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(MainTab.allCases, id: \.self) { tab in
                if tab != MainTab.allCases.first {
                    Spacer(minLength: 0)
                }

                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 0) {
                        Image(tab.icon(isSelected: selectedTab == tab))

                        Text(tab.title)
                            .typography(.tabbarText)
                            .foregroundStyle(selectedTab == tab ? .subGreen : .gray270)
                    }
                    .frame(width: 44)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 7)
        .background(.white)
    }
}

#Preview {
    MainTabBar(selectedTab: .constant(.order))
}
